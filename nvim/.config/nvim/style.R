#!/usr/local/bin/R
# simple script to call style_file from styleR package
# from command line, to run from from conform.nvim
args <- commandArgs(trailingOnly = TRUE)
options(styler.quiet = TRUE)
styler::style_file(args[1])
