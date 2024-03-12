# Luminary - Sistema de Gerenciamento de Avaliações de Artigos em Eventos Científicos

Este projeto é uma aplicação web desenvolvida em Ruby e utilizando Tailwind CSS, criada com o objetivo de gerenciar as avaliações de artigos em eventos científicos. O sistema possui três tipos de usuários: Autor, Administrador e Avaliador.

## Requisitos do Sistema

1. **Fazer login e logout:** Todos os usuários podem fazer login e acessar apenas as funcionalidades permitidas.

2. **Submeter, editar e deletar artigos:** Autores podem submeter, editar e deletar seus artigos, gerenciando informações como título, resumo, link para o PDF e lista de autores.

3. **Cadastrar, deletar e editar usuários:** Administradores podem gerenciar usuários, incluindo nome, e-mail, login, senha e tipo de usuário.

4. **Deletar artigos de qualquer usuário:** Administradores têm permissão para listar e deletar artigos de qualquer usuário.

5. **Atribuir artigos para avaliação:** Administradores podem listar todos os artigos e atribuir até três avaliadores para cada um.

6. **Avaliar artigos:** Avaliadores podem listar todos os artigos, atribuir notas de relevância (N1) e nível de experiência (N2), e a nota final é calculada multiplicando N1 por N2.

7. **Selecionar artigos para publicação:** O administrador pode visualizar os artigos ordenados por pontuação média das notas dos revisores e escolher quais serão publicados.

## Configuração dos Grupos

Este projeto pode ser desenvolvido individualmente, em duplas ou em grupos de até três pessoas.

## Tecnologias Utilizadas

- Ruby
- Tailwind CSS
- MVC (Model-View-Controller)

