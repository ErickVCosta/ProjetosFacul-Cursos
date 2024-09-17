import os

def linha(tam=42):
    return '=' * tam

def cabeçalho(txt):
    print(linha())
    print(txt.center(42))
    print(linha())
    
def menu():
    cabeçalho('Menu')
    print("| 1 - Adicionar Produtos                 |")
    print("| 2 - Atualizar Produtos                 |")
    print("| 3 - Listar Produtos                    |")
    print("| 0 - SAIR                               |")
    print(linha())
    
def limpaTerminal():
    return os.system('cls' if os.name == 'nt'  else 'clear')
