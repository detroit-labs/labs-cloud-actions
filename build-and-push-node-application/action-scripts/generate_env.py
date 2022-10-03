#!/usr/bin/env python

import sys
from jinja2 import Environment, FileSystemLoader
import os

def output_env_js():
  '''
  Read environment variables and generate a corresponding JavaScript file from them.
  '''
  j2_env = Environment(loader=FileSystemLoader('/app'), trim_blocks=True)

  print(j2_env.get_template('env.jinja2').render(env_vars=os.environ))

if __name__ == '__main__':
  output_env_js()