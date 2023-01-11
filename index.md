# Welcome to STA 561 Probabilistic Machine Learning Spring 2023

## Quick references:
* Instructor: Eric Laber, eric.laber@duke.edu, laber-labs.com
* Office hours:  M 9:00AM-10:00AM, Sun 8PM or by appt, location: zoom 
* TAs: 
  - Raphael Morsomme (raphael.morsomme@duke.edu)
  - Pritam Dey (pritam.dey@duke.edu)
  - Yueqi Guo (yueqi.guo@duke.edu)
  - Rick Presman (rick.presman@duke.edu)
  - Kunal Gupta (kunal.gupta@duke.edu)
  - Karthikeyan K (kk405@duke.edu)
  - Daniela De Albuquerque (daniela.de.albuquerque@duke.edu)
  - Jiachang Liu (jiachang.liu@duke.edu)
* TA office hours will be set in your lab sections 
*  [Course Sakai Page](https://sakai.duke.edu/portal/directtool/1e82ca35-6fea-440f-985c-cae5506c5691/)

## Overview 
The goal of this course is introduce the statsitical underpinnings needed to solve a
many modern statistical problems.  Our focus will be on key ideas in prediction and decision 
making. Often we will try to find the simplest version of a problem/algorithm/idea 
that illustrates salient features while leaving more complex nuanced versions to 
homework or to self-study.  On a related note, this course is **not** a catalog 
of machine learning algorithms and all their variants; such a catalog would
immediately be out-of-date as new methods are constantly being introduced (furthemore, 
learning and using new methods becomes dramatically easier if one has strong intuitive and theoretical
understanding of the foundations of statistics/ML.)  While much of our lecture time will be
spent on proofs and derivations, the homework will involve putting these indeas into practice 
with simulation experiments or data anlyses.  

## Pre-requisites 
I will assume that students have a basic understanding of mathematical statistics,
calculus, basic analyses, linear algebgra, and computing.  There are many excellent 
resources online for shoring gaps in these areas.  Coursera, EdX, Udemy, YouTube, etc., are a
great place to start.  While I will do my best to review key ideas, I will take for
granted that students know basic results such as the strong law of large numbers, the
central limit theorem, and matrix decompositions.  I will also be holding several review
sessions throughout the semester to help students prepare for more technical material if
it appears that there is interest.  


## Syllabus (subject to change; roughly one topic per week)
1.  Linear regression review 
2.  Linear regression and regularization and noise addition 
3.  Cross-validation and inference
4.  Post selection inference  
5.  Linear regression and online estimation 
6.  Kernel methods 
7.  Random forests 
8.  Partial linear models 
9.  Active learning (i.e., sequential experimental design)
10.  Large margin classifiers 
11.  Nearest neighbor methods 
12.  Batch decision problems (one-stage)
13.  Batch decision problems (mult-stage)
14.  Contextual bandits 
15.  Reinforcement learning

## References
We will primarily use slides and the (virtual) whiteboard for lectures.  A list of
references for background and/or further study will be provided with each topic. 
General references that you may find useful include: 
- *Elements of Statistical Learning,* Hastie, Tibshirani, and Freedman  [PDF](https://web.stanford.edu/~hastie/ElemStatLearn/)
- *Reinforcement learning,* Sutton and Barto [PDF](http://incompleteideas.net/book/the-book.html)
- *Pattern Classification,* Duda, Hart, and Stork [Amazon](https://www.amazon.com/Pattern-Classification-Pt-1-Richard-Duda/dp/0471056693/ref=sr_1_1?dchild=1&keywords=duda+and+hart&qid=1608491709&sr=8-1), there are pdfs online from the authors  but they've asked others not to distribute so not linked here

Some references on classic linear models that may be useful for background include
- *Linear Models with Python,* Faraway [Amazon](https://www.amazon.com/Linear-Models-Chapman-Statistical-Science/dp/1138483958/ref=sr_1_2?dchild=1&keywords=linear+models+in+python&qid=1614171236&s=books&sr=1-2)
- *Transformation and Weighting in Regression,* Carroll and Ruppert [Amazon](https://www.amazon.com/Transformation-Regression-Monographs-Statistics-Probability/dp/0412014211/ref=sr_1_5?dchild=1&keywords=transformation+regression&qid=1614171344&s=books&sr=1-5)

## Advice 
The objective of this course is to develop your statistical thinking for prediction
and decision problems. I strongly encourage you to work with your classmates on
all homework and projects and to focus on a deep understanding rather than
your grades.  Some of the problems will be ambiguous and open-ended.  This is
(mostly) intentional and intended to provide you with practice making choices
and assumptions when you approach an ill-defined problem.  (In application, problems
are rarely cleanly when they first reach you.)  I also encourage you to find other
sources of information that explain the same material another way or that explore issues
that we didn't cover in class.  

## Grading
Grades will be based on homework (80%) and a project (20%).  You can work
with your classmates on everything. Thus, by appealing to the wisdom of 
crowds, there is no reason for low HW scores.  Late homework will not be accepted but the
lowest two homeworks will be dropped.  

## COVID
Due to COVID-19 the course will be partly online.  This is unfortunate because meeting in person
can often give me clues about which topics are causing confusion (or boredom!) and allow me
to adapt material accordingly.  Because I won't be able to see your eyes gloss over or see the pained
expressions on your faces, we will need to take extra steps to make sure that everyone
is following along.  Please let me or your TAs know if you are struggling with the material 
and if/what extra content might be helpful.  We may also need to slow down to accommodate this new format.
I would rather you learn 10 topics well than 15 topics poorly.  

## Once my student
Once my student, always my student.  After this class if over, please don't hesitate 
to reach out if there's something you think I might be able to help you with. (Statistics-wise or
lifewise etc.  However, 
I don't want support the go fund me for your novel, I read a few of the chapters you released 
online, and let's be honest, they're not very good. Your writing is terrible and we are all
dumber for having read them. Now, that idea you had for an doggie-door
that does automatic grooming...I might be able to get behind that.) 



## Lectures
1. Review of linear regresion
- [Slides](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/topic_zero_linear_regression_basics_2022.pdf)
- [Homework one](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw1_2021.pdf)
- [Image example notebook](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/image_example.ipynb)
- [lineberger_study_data.csv](https://github.com/ericlaber/ericlaber.github.io/raw/main/docs/lineberger_study_data.csv)
- [Material summary and proofs](https://github.com/ericlaber/ericlaber.github.io/raw/main/docs/linear_reg_notes_part_one_2022.pdf)
- Lab topic: Intro to pycharm and jupyter notebooks 

2. Linear regression and regularization
- [Slides](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/topic_one_linear_regression_regularization.pdf)
- [Homework two](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw2_2022.pdf)
- [allSubsets.R](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/allSubsets.R)
- [growingLinerModel.R](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/growingLinearModel.R)
- [lasso.R](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/lasso.R)
- Lab topic: Ridge and Lasso with CV, GCV, AIC, and BIC
- Optional additional reading: Chapter three of [ESL](https://web.stanford.edu/~hastie/ElemStatLearn/)

3. Scaling up 
- [Slides](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/topic_two_scaling_up.pdf)
- [Homework three](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw3_2021_reasonable_version.pdf)
- [SIS example R code](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/screen.R)
- [distributed OLS and Lasso example R code](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/gen_distributed_data.R)
- [distributed Cox-PH](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/coxph.R)
- [Simple projections R code](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/simple_random_projection.R)
- Lab topic: Kernel methods
- Optional additional reading:  [Dual Ridge Regression](https://www.seas.upenn.edu/~cis520/papers/dual_ridge.pdf), [Random Projections and Large Scale Regression](https://arxiv.org/pdf/1701.05325.pdf)
- [PRFAQ Plan Template](https://github.com/ericlaber/ericlaber.github.io/raw/main/docs/PRFAQ%20Plan.docx)
- [An interactive review of gradient descent](https://the-learning-machine.com/article/optimization/gradient-descent)
- [Robbins and Monro (1951)](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/Robbins1951.pdf)
- [Exam one (This is for fun this year!)](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/exam_one_2021.pdf)
- [Homework four](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw4_1_2022.pdf)
- [Homework five and six](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw56_2022.pdf)

4. Classification
- [Slides](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/topic_three_getting_classy.pdf)
- [Homework seven](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw6_2021.pdf)
- [Uniform Random Forests](https://arxiv.org/pdf/1407.3939.pdf)
- [Breiman (2001) Random Forests](https://www.stat.berkeley.edu/~breiman/randomforest2001.pdf)
- [Convex Surrogates](https://people.eecs.berkeley.edu/~wainwrig/stat241b/bartlettetal.pdf)
- [Intro to generalization error](https://arxiv.org/pdf/1812.08696.pdf) 
- [Convex surrogates in simple decision problems](https://jmlr.csail.mit.edu/papers/volume20/18-191/18-191.pdf) 

5. Decision making
- [Slides](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/topic_four_decisions_are_hard.pdf)
- [Homework 8-9](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw78_2021.pdf)
- [Review of precision medicine](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6502478/)
- [Excellent review of bandits](https://arxiv.org/abs/1904.07272)
- [What's so special about Markov Decision Processes?](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.161.1580&rep=rep1&type=pdf)
- [V-learning](https://www.tandfonline.com/doi/10.1080/01621459.2018.1537919)
- [Bayesian Selection Paradoxes](https://www.jstor.org/stable/4355805?seq=1#metadata_info_tab_contents)
- [Final homework (finally!)](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw9_2021.pdf)
