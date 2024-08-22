import subprocess
import os

def run_flake8():
    print("Ejecutando Flake8...")
    result = subprocess.run(['flake8', 'src', 'tests'], capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print("Errores de Flake8:", result.stderr)

def run_black():
    print("Ejecutando Black...")
    result = subprocess.run(['black', '--check', 'src', 'tests'], capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print("Errores de Black:", result.stderr)

def run_pylint():
    print("Ejecutando Pylint...")
    result = subprocess.run(['pylint', 'src', 'tests'], capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print("Errores de Pylint:", result.stderr)

def run_bandit():
    print("Ejecutando Bandit...")
    result = subprocess.run(['bandit', '-r', 'src', 'tests'], capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print("Errores de Bandit:", result.stderr)

if __name__ == "__main__":
    run_flake8()
    run_black()
    run_pylint()
    run_bandit()
