import unittest
from io import StringIO
import sys
from src.hello_world import hello_world  # Importa la función desde el módulo

class TestHelloWorld(unittest.TestCase):
    def setUp(self):
        # Redirige la salida estándar para capturar el output
        self.held_output = StringIO()
        sys.stdout = self.held_output

    def tearDown(self):
        # Restablece la salida estándar
        sys.stdout = sys.__stdout__

    def test_hello_world(self):
        # Llama a la función que queremos probar
        hello_world()
        # Obtén el output de la función
        self.held_output.seek(0)
        output = self.held_output.read().strip()
        # Verifica que el output es el esperado
        self.assertEqual(output, "Hello World")

if __name__ == "__main__":
    unittest.main()
