import defs

produtos = [
    {"nome": "RTX 3060 Ventus", "preço": 1729.99, "quantidade": 95},
    {"nome": "RTX 4060 TI Ventus", "preço": 2319.99, "quantidade": 50},
    {"nome": "Mouse Gamer Redragon Cobra", "preço": 119.99, "quantidade": 65},
    {"nome": "Water Cooler Gamer Rise Mode","preço": 289.99, "quantidade": 97},
    {"nome": "Placa Mãe A520M - A Pro", "preço": 359.99, "quantidade": 77},
]

while True:
        defs.limpaTerminal
        defs.menu()
        opcao = input("Digite a opção desejada: ")

        if opcao == "1":
            while True:
                defs.limpaTerminal()
                nome = input("Digite o nome do produto: ")
                preço = float(input("Digite o preço do produto: "))
                while True:
                    try:
                        quantidade = int(input("Digite a quantidade do produto: "))
                        break
                    except ValueError:
                        print('Digite um número válido.')
                produtos.append({"nome": nome, "preço": preço, "quantidade": quantidade})
                
                print("Produto cadastrado com sucesso!")
                input("Pressione qualquer tecla para continuar...")
                
                continuar = input("Deseja continuar cadastrando produtos? (s/n) ")
                if continuar == "n":
                    break

        elif opcao == "2":
            defs.limpaTerminal()
    
            nome = input("Digite o nome do produto a ser atualizado: ")
            produto = next((p for p in produtos if p["nome"] == nome), None)

            if produto is None:
                print("Produto não encontrado.")
            else:
                defs.limpaTerminal()
        
                novo_preço = float(input("Digite o novo preço: "))
                nova_quantidade = int(input("Digite a nova quantidade: "))

                produto["preço"] = novo_preço
                produto["quantidade"] = nova_quantidade
                
        elif opcao == '3':
            defs.limpaTerminal() 
            defs.cabeçalho("Produtos em estoque")
            for produto in produtos:
                print(f"- {produto['nome']}: R${produto['preço']:.2f} - {produto['quantidade']} unidades")
                
        elif opcao == "0":
            print("Saindo.... Até mais.")
            break
        else:
            print('Opção Inválida! Tente Novamente.')