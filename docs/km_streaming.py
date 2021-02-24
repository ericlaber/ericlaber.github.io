import numpy as np
import numpy.random as nr
from typing import Optional
import matplotlib.pyplot as plt
from statsmodels.distributions.empirical_distribution import ECDF
import tqdm
import pdb


def streaming_km(
        observed_times: np.ndarray,
        censoring_ind: np.ndarray,
        failure_set: Optional[dict] = {},
        risk_set: Optional[dict] = {}
) -> dict:
    """
    Compute the Kaplan-Meier estimator and sufficient statistics with
    single sweep through the data

    :param observed_times: 1D np.array of observed times, i.e., the
        minimum of failure and censoring times
    :param censoring_ind: 1D np.array of indicators that an observation
        was censored
    :param failure_set: a dictionary mapping failure times to
        the number of observed failures at that time, if None an empty
        dictionary is created.  This allows us to sequentially process
        multiple datasets.  Note that we do not changed passed dictionaries.
    :param risk_set: a dictionary mapping failure times to the
        number of individuals at risk.
    :return: dictionary with key --> value pairs:
        failure_set -> dictionary with keys corresponding to unique failure
            times and values corresponding to number of observed failures at
            that (key) time
        risk_set -> dictionary with keys corresponding to unique failure
            times and values corresponding to number of individuals at risk
            at that (key) time
        km -> dictionary with keys corresponding to unique failure times
            and values corresponding to Kaplan-Meier estimator of
            survivor function.
    """
    local_failure_set = failure_set.copy()
    local_risk_set = risk_set.copy()
    for t, delta in zip(observed_times, censoring_ind):
        if delta == 1:
            if t not in local_failure_set:
                local_failure_set[t] = 0.0
            local_failure_set[t] += 1.0
            if t not in local_risk_set:
                local_risk_set[t] = 0.0
            unique_failure_times = np.sort(list(local_failure_set.keys()))
            t_index = np.where(unique_failure_times == t)[0][0]
            if t_index < len(unique_failure_times) - 1: # not last
                local_risk_set[t] += \
                    local_risk_set[unique_failure_times[t_index+1]]

        risk_times = [w for w in local_risk_set.keys() if w <= t]
        for at_risk_time in risk_times:
            local_risk_set[at_risk_time] += 1.0

    # Compute KM estimator
    unique_failure_times = np.sort(list(local_failure_set.keys()))
    discrete_hazard = np.array(
        [local_failure_set[j]/local_risk_set[j] for j in unique_failure_times]
    )
    km = np.cumprod(1-discrete_hazard)
    km_dict = dict(zip(unique_failure_times, km))
    return {"failure_set": local_failure_set, "risk_set": local_risk_set,
            "km": km_dict}


if __name__ == "__main__":
    # Generate right-censored data
    nr.seed(1) # for replicability
    n = 100
    true_failure_times = nr.exponential(size=n)*100
    censoring_times = nr.exponential(size=n)*100

    # Note that you could do this in one step rather than two
    observed_times = np.array(
        [min(t, c) for t, c in zip(true_failure_times, censoring_times)]
    )
    censoring_indicator = np.array(
        [t <= c for t, c in zip(true_failure_times, censoring_times)]
    )
    km_est = streaming_km(observed_times, censoring_indicator)
    plt.plot(km_est["km"].keys(), km_est["km"].values())
    ecdf = ECDF(true_failure_times)(
        np.linspace(min(observed_times), max(observed_times))
    )
    plt.plot(np.linspace(min(observed_times), max(observed_times)), 1-ecdf)
    plt.show()