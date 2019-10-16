<style>
.small-code pre code {
  font-size: 1em;
}
</style>

The Error We Make When Inferring A Phylogeny
========================================================
author: Richel J.C. Bilderbeek, Thijs Janzen, Giovanni Laudanno
date:
transition: rotate
autosize: true

![](CC-BY-NC-SA.png)
[https://github.com/richelbilderbeek/tres_presentation_20191016](https://github.com/richelbilderbeek/tres_presentation_20191016)




Biology: which species lived when?
========================================================

![](crocodilians.png)

What we measure in the field
========================================================

![plot of chunk unnamed-chunk-2](tres_presentation_20191016-figure/unnamed-chunk-2-1.png)

What we infer
========================================================

A posterior

![plot of chunk unnamed-chunk-3](tres_presentation_20191016-figure/unnamed-chunk-3-1.png)

***

A consensus tree

![plot of chunk unnamed-chunk-4](tres_presentation_20191016-figure/unnamed-chunk-4-1.png)

What is the error we make?
========================================================

The possible true tree

![plot of chunk unnamed-chunk-5](tres_presentation_20191016-figure/unnamed-chunk-5-1.png)

***

What we inferred

![plot of chunk unnamed-chunk-6](tres_presentation_20191016-figure/unnamed-chunk-6-1.png)

Tool to quantify this error
========================================================


```r
library(pirouette)
```

 * `pirouette`
 * R Package
 * GPL-3 license
 * [https://github.com/richelbilderbeek/pirouette](https://github.com/richelbilderbeek/pirouette)
 * Used to do all experiments in this presentation

Quantify the error
========================================================

![plot of chunk unnamed-chunk-8](tres_presentation_20191016-figure/unnamed-chunk-8-1.png)
![plot of chunk unnamed-chunk-9](tres_presentation_20191016-figure/unnamed-chunk-9-1.png)
![plot of chunk unnamed-chunk-10](tres_presentation_20191016-figure/unnamed-chunk-10-1.png)
![plot of chunk unnamed-chunk-11](tres_presentation_20191016-figure/unnamed-chunk-11-1.png)

Biological relevance
========================================================

 * We do inference with standard models
 * These standard models may not suffice in all contexts
 * With `pirouette` we can measure the error caused by mismatch
   between using a standard model when (the simulated) nature follows
   a different one



Using a PBD model
========================================================

![plot of chunk unnamed-chunk-13](tres_presentation_20191016-figure/unnamed-chunk-13-1.png)
![plot of chunk unnamed-chunk-14](tres_presentation_20191016-figure/unnamed-chunk-14-1.png)
![plot of chunk unnamed-chunk-15](tres_presentation_20191016-figure/unnamed-chunk-15-1.png)
![plot of chunk unnamed-chunk-16](tres_presentation_20191016-figure/unnamed-chunk-16-1.png)

Caveat
========================================================

Error is caused by
 * Stochasticity in alignment simulation
 * Stochasticity in posterior trees
 * Mismatch between true speciation model and the one assumed

We can remove this mismatch: *Twinning*

Twinning
========================================================

![plot of chunk unnamed-chunk-17](tres_presentation_20191016-figure/unnamed-chunk-17-1.png)

***

![plot of chunk unnamed-chunk-18](tres_presentation_20191016-figure/unnamed-chunk-18-1.png)

Twin pipeline
========================================================

![plot of chunk unnamed-chunk-19](tres_presentation_20191016-figure/unnamed-chunk-19-1.png)
![plot of chunk unnamed-chunk-20](tres_presentation_20191016-figure/unnamed-chunk-20-1.png)
![plot of chunk unnamed-chunk-21](tres_presentation_20191016-figure/unnamed-chunk-21-1.png)
![plot of chunk unnamed-chunk-22](tres_presentation_20191016-figure/unnamed-chunk-22-1.png)

Comparing errors
========================================================

Full error:

![plot of chunk unnamed-chunk-23](tres_presentation_20191016-figure/unnamed-chunk-23-1.png)

***

Baseline error:

![plot of chunk unnamed-chunk-24](tres_presentation_20191016-figure/unnamed-chunk-24-1.png)

Biological interpretation of true and twin error distribution
========================================================

Two distributions are ...|then our inference is ...|due to ...
-------------------------|-------------------------|----------------
Very simular             |as good as we can        |the standard speciation priors being good enough
Very different           |bad                      |using the wrong speciation prior
In between               |disputable               |using the wrong speciation prior

Case study: Multiple birth model / Crowded phylogenies
========================================================

 * By Giovanni Laudanno, Richel J.C. Bilderbeek and Rampal S. Etienne

Case study: Multiple birth model / Crowded phylogenies
========================================================

<img src="mbd_picture_1.png" title="plot of chunk unnamed-chunk-25" alt="plot of chunk unnamed-chunk-25" width="85%" />


* Speciations occur in bursts
* Process is poorly understood

***

<img src="mbd_picture_2.png" title="plot of chunk unnamed-chunk-26" alt="plot of chunk unnamed-chunk-26" width="100%" />

Case study: Multiple birth model / Species pump
========================================================

<img src="mbd_picture_3.png" title="plot of chunk unnamed-chunk-27" alt="plot of chunk unnamed-chunk-27" width="60%" />

* Changes in connectivity promote speciation
* Species pump hypothesis

Case study: Multiple birth model / Process
========================================================

&nbsp;

&nbsp;

* $\lambda$ is the per-species speciation rate
* $\mu$ is the per-species extinction rate
* $\nu$ is the environmental change rate
* $q$ is the per-species speciation probability when an environmental change occurs

***

<img src="mbd_picture_4.png" title="plot of chunk unnamed-chunk-28" alt="plot of chunk unnamed-chunk-28" width="110%" />

Case study: Multiple birth model / Parameter choice 1
========================================================

<img src="mbd_picture_5.png" title="plot of chunk unnamed-chunk-29" alt="plot of chunk unnamed-chunk-29" width="100%" />

***

<img src="mbd_picture_6.png" title="plot of chunk unnamed-chunk-30" alt="plot of chunk unnamed-chunk-30" width="100%" />

Case study: Multiple birth model / Parameter choice 2
========================================================

[picture absent]



***

[picture absent]



Case study: substitutions at the nodes
========================================================

 * by Thijs Janzen, Rampal Etienne & Folmer Bokma

Non-constant substitution rates
========================================================
* Problem: number of substitutions across branches is often not the same:

<div align="center">
<img src="sub_rate_PNAS.png" height=500>
</div>

        Moorjani et al. 2016 PNAS

Bayesian Solution
========================================================
* Implement different clock rates, e.g.:
  * along some branches, substitutions accumulate faster, along others slower
  * but overall, all substitution rates are drawn from the same distribution

<div align="center">
<img src="uncorrelatedClock.png" height=500>
</div>
              https://beast.community/clocks

Biological interpretation lacking
========================================================
Here, I propose an alternative explanation:
* branching (speciation) events generate additional substitutions
* a higher accumulated number of substitutions is indicative of past branching events that can no longer be measured, e.g. speciation events followed by extinction

![plot of chunk unnamed-chunk-33](tres_presentation_20191016-figure/unnamed-chunk-33-1.png)![plot of chunk unnamed-chunk-33](tres_presentation_20191016-figure/unnamed-chunk-33-2.png)

Approach
========================================================
* Before implementing the full likelihood into BEAST
  * use pirouette to test if the two node substitution models affect tree inference at all
  * check what substitution rate model is favoured when using a node substitution model

Proposed Node Substitution model
========================================================
<div align="center">
<img src="node_sub_models.png" height=900>
</div>


Results: Error
========================================================
<div align="center">
<img src="results_node_sub.png" height=900>
</div>

Results: Substitution rate
========================================================

Conclusions and outlook
========================================================
* node substitutions significantly affect tree inference
* node substitutions reflect a relaxed clock model

<br/>


* investigate effect on non-balanced trees

<br/>

* formulate likelihood function
* create BEAST module

Conclusions
========================================================

 * `pirouette` shows the error we make in phylogenetic inference
 * We can prove show inference models do not work in all theoretical cases
 * Yet unknown to what extent (MBness, nodeSubness) these cases are present in nature

Questions
========================================================

?
