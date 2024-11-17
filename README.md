# Mini Fazenda 🌾

Mini Fazenda é um jogo casual de simulação onde o jogador administra uma pequena fazenda. Plante, colha e gerencie recursos enquanto vê sua fazenda prosperar!

![Preview do Jogo](path/to/screenshot.png) <!-- Adicione um screenshot do jogo -->

---

## 📚 Sobre o Projeto

O jogo foi desenvolvido utilizando **Flutter Flame**, um motor 2D que permite a criação de jogos com alta performance e facilidade de integração com Flutter. O projeto também incorpora conceitos como:

- Gestão de tempo dentro do jogo (relógio analógico simulado).
- Interface de usuário (HUD) interativa com informações importantes.
- Menus expansíveis para ações como inventário, loja e mapa.
- Lógica de plantio e colheita de diferentes plantas.

---

## 🚀 Funcionalidades

- 🌱 **Plantar e Colher**: Escolha sementes, plante e colha quando estiverem maduras.
- 🕰️ **Relógio Simulado**: Acompanhe o passar do tempo com um relógio analógico.
- 💰 **Gerenciamento de Recursos**: Veja o dinheiro acumulado ao vender produtos.
- 🧑‍🌾 **HUD Personalizado**: Foto, nome e progresso de nível do jogador.
- 📦 **Menu Expandível**: Acesse inventário, loja e mapa com facilidade.

---

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework principal para a interface.
- **Flutter Flame**: Motor 2D para mecânicas e renderização do jogo.
- **Dart**: Linguagem de programação.
- **Custom Paint**: Para desenhar e personalizar gráficos como o relógio analógico.

---

## 📦 Estrutura do Projeto

```plaintext
mini_fazenda/
├── assets/            # Recursos como imagens, sprites e sons
├── lib/
│   ├── game/          # Código relacionado ao núcleo do jogo
│   │   ├── components/ # Componentes como Tile e Plant
│   │   │
│   │   └── mini_fazenda_game.dart
│   ├── ui/            # Widgets para menus e HUD
│   │   ├── hud/        # HUD
│   └── main.dart      # Entrada do app
└── README.md
```

## ⚙️ Como executar ?

- **Clone o repositório**

```plaintext
git clone https://github.com/seu-usuario/mini-fazenda.git
cd mini-fazenda
```

- **Instale as dependências**

```plaintext
flutter pub get
```

- **Execute o aplicativo**

```plaintext
flutter run
```

## 🌟 Roadmap

[] Implementar mapa explorável.
[] Adicionar animais para cuidar.
[] Melhorar IA e balanceamento das plantas. (Verificando verificando requisitos)
[] Criar missões e desafios.

## 🤝 Contribuições

**Contribuições são bem-vindas!**

Faça um fork do projeto.
Crie sua branch com a funcionalidade (git checkout -b feature/nova-funcionalidade).
Commit suas mudanças (git commit -m 'Adicionei uma nova funcionalidade').
Envie para a branch principal (git push origin feature/nova-funcionalidade).
Crie um Pull Request.
