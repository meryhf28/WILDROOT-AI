# WILDROOT AI

**Rule-based agronomic decision-support prototype built with R Shiny**  
**Developer:** María Hernández-Fernández  
**Live demonstration:** https://wildrootai.shinyapps.io/WILDROOT_AI/

WILDROOT AI is an interactive R Shiny application exploring prototype formulations of beneficial epiphytic yeasts for agricultural applications. Its interface collects information about the crop, soil, agronomic challenge, plant developmental stage, environmental conditions and intended application route. The prototype displays an illustrative formulation, functional profile, projected response curves and a downloadable text report.

> **Scientific disclosure:** Despite its name, the current application **does not implement machine learning, a trained artificial-intelligence model, or an AI API**. The formulation category is selected by **fixed conditional rules** based on the agronomic problem. Crop, soil, stage and climate are displayed in the report but do **not** change formulation selection in this version. The strain mixtures, proportions, concentration, percentages, functional scores and response curves are **hard-coded prototype values**, not experimentally validated forecasts. Do not use them as agronomic prescriptions, expected efficacy, or dosage guidance.

## Features

- Browser-based interactive interface (Spanish) built with `shiny`.
- Five rule-selected formulation concepts: WILDROOT Shield, Grow, Stress, Nutri, Nursery.
- Functional profile and response visualizations built with `ggplot2`.
- Prototype strain composition and descriptive mode-of-action information.
- Text report download for a selected demonstration scenario.
- A contact-form mock-up; **messages are not transmitted, stored or delivered**.

## Run locally

Requires R and the CRAN packages `shiny` and `ggplot2`. RStudio is optional.

From the repository folder, in R:

```r
install.packages(c("shiny", "ggplot2"))
shiny::runApp(".")
```

The image `www/logo_wildroot.png` must remain in its `www/` directory for the original interface to display correctly. No API key, external AI provider or paid service is required.

## Repository layout

- `app.R`: original user interface and server logic, **unchanged from the supplied application**.
- `www/logo_wildroot.png`: original branding image used by the app.
- `tests/smoke_test.R`: static parsing, basic startup and application-object checks.
- `.github/workflows/r-shiny-ci.yml`: automated checks on pushes and pull requests.
- `CITATION.cff`: preliminary software citation metadata. The DOI field is intentionally absent until an archive exists.

## Verification and limitations

The application is a **research and entrepreneurship demonstrator**, not a validated decision-support service. Its mock scores and percentage claims should not be interpreted as empirical outcome predictions. Users must validate all strain traits, compatibility, biosafety, permitted use, crop suitability and field efficacy before deployment or commercialization. Some strain identifiers, proportions and concentration suggestions are embedded in the source; see `PUBLICATION_REVIEW_ES.md` before making the repository public.

The source code contains a visible confirmation for contact submissions, but no message-delivery backend. No personal data entered in the form is sent by `app.R`.

## Authorship and citation

Developed in R Shiny by **María Hernández-Fernández**. The software is prepared for versioned citation through `CITATION.cff`; a DOI should be inserted only after the relevant release is archived.

**Licensing status:** An open-source license has **not yet been granted for this application**. Publishing source code alone does not license third parties to reuse it. Before publication, confirm software, biological-material and logo disclosure rights and choose an explicit license for the code (and independently for any visual assets).
