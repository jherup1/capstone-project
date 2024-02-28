#!/bin/bash
set -e

git stash

git fetch origin flutterflow
git merge origin/flutterflow

git stash pop
