> [!CAUTION]
> This file is still under construction!

# PJAIT thesis template written in Typst

This repository consists of two main files:
- `main.typ`, that is used to render your thesis
- `pjatk-template.typ`, which automates the styling of your thesis,
  including the generation of title pages
  with accordance to the university's requirements

## How do I use it?

**In summary**: You clone this repository,
you write content (text, images, tables, code listings, ...)
in `.typ` files
that you `#include` in your `main.typ` file,
and you compile that `main.typ` file.
This process creates a PDF.

**In detail**: This template uses [Typst](https://typst.app/),
so, theoretically, you will need _some_ understanding of this tool
before you jump into writing your thesis.
In practice, though, that's not necessarily the case.
In most cases, simple markdown-like formatting will be sufficient.

The sample document 
(the PDF rendered from `main.typ`, called `main.pdf`) 
explains almost everything you need
to typeset
(write and include)
the final content of your thesis.

Typst needs a [compiler](https://typst.app/open-source/#download).
It's a very small, self-contained `.exe`.
It's also very simple — just run `./typst compile main.typ --font-path="./contents/assets/fonts"`,
assuming you have downloaded and placed your `typst.exe` (the compiler)
in your project (next to the project files).

It's even easier if you:
- installed the used fonts in your system — then you can omit the `--font-path="./contents/assets/fonts"` part.
- added `typst.exe` to your PATH — then you can omit the `./` from `./typst`.
- use an alias — instead of `compile`, you can type `c`.

Thus, the shortest form becomes: `typst c main.typ`.

## Why would I use Typst instead of MS Word, Google Docs, or LaTeX?

Short answer(s):
- LaTeX is very cumbersome to use.
  It has a steep learning curve,
  and its complexity will not yield any benefits to you.
- MS Word and Google Docs are the most convenient to start with,
  but quickly become unreliable when your document grows.
  In many cases they quietly introduce bugs to your document.

Typst is fairly easy to learn.
And you don't even have to learn it well,
given that you are supplied with this repository's template.

Typst is robust and produces correct documents _quickly_.

Typst is text-based, rather than binary-based,
which means that it's perfect to use
with version control systems, like Git.
This also means that collaboration and revision
may be very straightforward yet effective and robust
— simply by employing (e.g., GitHub) issues and pull requests. 

## Okay, so how do I change the look of my document? I need to typeset my own title, my own name, my supervisor's name, etc.

Some, required to be present, elements
are customizable via the template's main function's arguments
— `apply-pjatk-template.with(...)`.

For example, if your name is _General CePlus_,
your student number is _s213742069_,
and your title is _Library for visualization of stack and heap in C++ programs_,
you would apply the template in the following manner:

```typst
#show: apply-pjatk-template.with(
    authors: ("General CePlus --- s213742069",),
    title: "Library for visualization of stack and heap in C++ programs"
)
```

Want to add your supervisor's name?
There's an argument for that too
— called `supervisor`:

```typst
#show: apply-pjatk-template.with(
    authors: ("General CePlus --- s213742069",),
    title: "Library for visualization of stack and heap in C++ programs",
    supervisor: "M.Eng. CeePlusPlus Wizard"
)
```

The documentation for all arguments
can be found at the end of this document.

## I don't like that inline code has a blue background

Call `apply-pjatk-template()` function
`with` the following argument: `highlight-inline-code: false`.

## Is there an argument for **everything**?

No.

To change some things,
you may need to change the template code
or apply a new [set / show rule](https://typst.app/docs/reference/styling/)
in your document(s).

## Documentation for `apply-pjatk-template()` function arguments

