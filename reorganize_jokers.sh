#!/bin/bash
# Script para reorganizar los jokers en la localización
# Uso: ./reorganize_jokers.sh

cd "$(dirname "$0")" || exit 1
python3 scripts/reorganize_localization_jokers.py
