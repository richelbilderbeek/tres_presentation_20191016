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




Overview
========================================================

Will be deleted before the actual presentation

 * 0-5 min: me: biological stuff
 * 5-15 min: me: pirouette's workflow, twinning
 * 15-20 min: (Giovanni) MBD: biology in a bit more detail, preliminary results
 * 20-30 min: (Thijs) nodeSub: biology in a bit more detail, difference with 'normale' pirouette pipeline, preliminary results

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
Very differeny           |bad                      |using the wrong speciation prior
In between               |disputable               |using the wrong speciation prior

Case study: MBD
========================================================

 * max 5 minutes, by Giovanni: biology in a bit more detail, preliminary results

Case study: nodeSub
========================================================

 * max 10 minutes, by Thijs: biology in a bit more detail, difference with 'normale' pirouette pipeline, preliminary results

Questions
========================================================

?
