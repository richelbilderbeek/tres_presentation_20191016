Case study: substitutions at the nodes
========================================================
author: Thijs Janzen, Rampal Etienne & Folmer Bokma
date: 14-10-2019
autosize: true



Non-constant substitution rates
========================================================
* Problem: number of substitutions across branches is often not the same:

<div align="center">
<img src="sub_rate_PNAS.png" width=800>
</div>

                            Moorjani et al. 2016 PNAS

Bayesian Solution
========================================================
* Implement different clock rates, e.g.:
  * along some branches, substitutions accumulate faster, along others slower
  * but overall, all substitution rates are drawn from the same distribution

<div align="center">
<img src="uncorrelatedClock.png" width=1000>
</div>
              https://beast.community/clocks

Biological interpretation lacking
========================================================
Here, I propose an alternative explanation:
* branching (speciation) events generate additional substitutions
* a higher accumulated number of substitutions is indicative of past branching events that can no longer be measured, e.g. speciation events followed by extinction

![plot of chunk unnamed-chunk-1](tres_presentation_part_thijs-figure/unnamed-chunk-1-1.png)
![plot of chunk unnamed-chunk-2](tres_presentation_part_thijs-figure/unnamed-chunk-2-1.png)

Proposed Node Substitution model
========================================================
<div align="center">
<img src="node_sub_models.png" height=900>
</div>

Approach
========================================================
* Before implementing the full likelihood into BEAST
  * use pirouette to test if the two node substitution models affect tree inference at all
  * check what clock model is favoured when using a node substitution model

Results: Error
========================================================
<div align="center">
<img src="results_node_sub.png" height=900>
</div>

Results: Clock model
========================================================



Conclusions and outlook
========================================================
* node substitutions significantly affect tree inference
* node substitutions reflect a relaxed clock

<br/>


* investigate effect on non-balanced trees

<br/>

* formulate likelihood function
* create BEAST module





