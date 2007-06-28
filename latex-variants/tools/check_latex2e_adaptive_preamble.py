#!/usr/bin/env python

# :Author: Guenter Milde
# :Contact: milde users.berlios.de
# :Revision: $Revision$
# :Date: $Date$
# :Copyright: Licensed under the Academic Free License version 1.2
# 
# ::

"""
Test script for "latex2e_adaptive_preamble" writer
"""

import imp, sys, os.path

from docutils.core import publish_string, publish_file

# Prepend parent dir to the PYTHONPATH and import writer module::

sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
from latex2e_adaptive_preamble import Writer

# Import a small set of rst syntax samples
import textsamples


# Customisable Settings
# =====================
# 
# Customise by (un)commenting appropriate lines

# Quick test samples
# ------------------
# ::

internal_samples = [
                    textsamples.title,
                    textsamples.bibliographic_list,
                    textsamples.table_of_contents,
                    #textsamples.admonitions,
                    textsamples.literal_block,
                    textsamples.line_block,
                    textsamples.table,
                    #textsamples.system_message
                   ]

# Samples from the docutils svn data
# ----------------------------------
# ::

syntax_samples_dir = '../../../docutils/test/functional/input/'

syntax_sample_files = ['data/standard.txt',
                       'data/table_colspan.txt',
                       'data/table_rowspan.txt',
                       # Tests for the LaTeX writer
                       'data/latex2e.txt',
                       'data/nonalphanumeric.txt',
                       'data/unicode.txt',
                       'data/custom_roles.txt',
                       #'data/errors.txt'
                      ]

# read coice of syntax samples
syntax_samples = [open(syntax_samples_dir+samplefile).read()
                  for samplefile in syntax_sample_files]


# Quick test or full text
# -----------------------
# ::

samples = internal_samples  # quick test of some selected samples
#samples = syntax_samples  # (takes longer, includes intended errors)

# Configuration settings
# ----------------------
# ::

overrides = {#'stylesheet': 'empty',
            }

# Path of output file
# -------------------
# ::
  
outpath = "../data/latex2e_adaptive_preamble-sample.tex"

# Convert and Print
# =================

# Join samples to string::

sample_string = '\n'.join(samples)

# Document tree (as pseudoxml rendering) for comparision::

## Uncomment to activate:
# doctree = publish_string(sample_string, writer_name="pseudoxml")
# print doctree 

# Convert to LaTeX::

output = publish_string(sample_string, 
                        settings_overrides=overrides,
                        writer=Writer())

# Replace image links::

output = output.replace('../../../docs/user/rst/images/',
                        '../../../docutils/docs/user/rst/images/')

# Print and save::

print output

outfile = open(outpath, 'w')
outfile.write(output)



