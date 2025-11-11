#import "pjatk-template.typ": apply-pjatk-template
#show: apply-pjatk-template.with(language: "en")

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(
    zebra-fill: none,
    breakable: true,
    number-align: left, 
    number-placement: "outside",
    number-format: (n) => text(luma(180))[#str(n)],
    stroke: none,
    inset: (top: 0.25em, bottom: 0.25em),
    display-icon: false,
    display-name: false
)

#include "contents/introduction.typ"

#include "contents/content.typ"
