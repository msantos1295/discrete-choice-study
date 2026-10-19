# discrete-choice-study

Self-study of discrete choice modeling, following Kenneth Train's
[*Discrete Choice Methods with Simulation*](https://eml.berkeley.edu/books/choice2.html) (2nd ed., 2009),
with exercises in R using logitr, mlogit, apollo and cbcTools.
All data in this repo are simulated or public.

## Structure

```
R/          my function library (simulators, MNL, optimizers, MXL), grows by module
data/       simulated and public data
modules/    one folder per module: notes.qmd (reading notes) + exercises.qmd (R work)
capstone/   final project
```

Render a module's exercises from the R console with
`quarto::quarto_render("modules/02-logit/exercises.qmd")`, or from the terminal with
`quarto render modules/02-logit/exercises.qmd`.

## Progress

- [ ] 0. Setup
- [ ] 1. Properties of discrete choice models (Ch. 1, 2)
- [ ] 2. Logit (Ch. 3)
- [ ] 3. Numerical maximization (Ch. 8)
- [ ] 4. GEV and nested logit (Ch. 4)
- [ ] 5. Probit (Ch. 5)
- [ ] 6. Mixed logit (Ch. 6)
- [ ] 7. Variations on a theme (Ch. 7)
- [ ] 8. Drawing from densities (Ch. 9)
- [ ] 9. Simulation-assisted estimation (Ch. 10)
- [ ] 10. Individual-level parameters (Ch. 11)
- [ ] 11. Bayesian procedures (Ch. 12)
- [ ] 12. Latent class and EM (Ch. 14)
- [ ] 13. Endogeneity (Ch. 13)
- [ ] 14. Experimental design and power
- [ ] 15. WTP space, uncertainty and reporting
- [ ] 16. Capstone
