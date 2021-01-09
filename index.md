# Welcome to STA 561 Probabilistic Machine Learning

## Quick references:
* Instructor: Eric Laber, eric.laber@duke.edu, laber-labs.com
* Office hours:  M-W 10-11AM or by appt, location: zoom 
* TAs: 
  - Yuhan Chen (yhan.chen@duke.edu)
  - Yi Guo (yi.guo1@duke.edu)
  - Vinayak Gupta (vinayak.gupta@duke.edu)
  - Hunter Klein (michael.klein413@duke.edu)
  - Bai Li (bai.li@duke.edu)
  - Ed Tam (edric.tam@duke.edu)
* TA office hours will be set in your lab sections 

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
I will assume that students havea basic understanding of mathematical statistics,
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
Grades will be based on homework (50%), exams (30%), and a project (20%).  You can work
with your classmates on everything but the exams. Thus, by appealing to the wisdom of 
crowds, there is no reason for low HW scores.  Late homework will not be accepted but the
lowest two homeworks will be dropped.  

## COVID
Due to COVID-19 the course will be entirely online.  This is unfortunate because meeting in person
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
- [Slides](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/topic_zero_linear_regression_basics.pdf)
- [Homework one](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/hw1_2021.pdf)
- [lineberger_study_data.csv](https://github.com/ericlaber/ericlaber.github.io/blob/main/docs/lineberger_study_data.csv)
