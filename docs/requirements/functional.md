# Especificação de Requisitos de Software

Este documento descreve os requisitos de software para a aplicação web **Simple Box** projetada para gerenciar objetos multimídia, incluindo imagens, áudios e vídeos.

O Simple Box é uma aplicação baseada na web que permite aos usuários:
- Autenticar e autorizar: sign up, sign in e gerenciar contas de usuário;
- Gerenciar perfis de usuário: editar e atualizar informações do usuário logado.
- Realizar de operações nos objetos multimídia:
	- Adicionar novas imagens, arquivos de áudio e vídeos;
	- Visualizar objetos multimídia existentes;
	- Atualizar informações e conteúdo de objetos existentes;
	- Excluir objetos multimídia indesejados.
- Pesquisar objetos específicos usando palavras-chave relacionadas à descrição, nome e tags.
- Visualizar listas de todos os objetos ou listas filtradas com base no tipo (imagens, áudio, vídeos) ou por qualquer combinação de critérios de pesquisa.
- Selecionar um objeto da lista e visualizar seus detalhes completos de conteúdo.

# Requisitos Funcionais

## 1. Gerenciamento de Usuários

| ID    | Nome                    | Descrição                                                                                                  |
| ----- | ----------------------- | ---------------------------------------------------------------------------------------------------------- |
| RF1.1 | Cadastro de usuário     | O sistema deve permitir que os usuários se registrem e criem novas contas                                  |
| RF1.2 | Login do usuário        | O sistema deve autenticar os usuários por meio de credenciais de login (nome de usuário e senha)           |
| RF1.3 | Edição do perfil        | O sistema deve permitir que usuários autorizados gerenciem seus perfis (editar informações, alterar senha) |
| RF1.4 | Propriedades do usuário | Manter nome completo, username, password, email, imagem do perfil, descrição e data de criação do usuário  |
## 2. Gerenciamento de Objetos Multimídia

| ID     | Nome                               | Descrição                                                                                                                                                                                                                                                                                                       |
| ------ | ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| RF2.1  | Upload de arquivos                 | O sistema deve permitir que usuários autorizados façam upload de novas imagens (JPEG, JPG, PNG, GIF, SVG, WebP), arquivos de áudio (MP3, WAV, OGG, FLAC) e arquivos de vídeo (MP4, AVI, MOV, WebM)                                                                                                              |
| RF2.2  | Segurança dos arquivos             | O sistema deve armazenar objetos multimídia carregados com segurança                                                                                                                                                                                                                                            |
| RF2.3  | Visualização de arquivos           | O sistema deve permitir que usuários autorizados visualizem objetos multimídia existentes                                                                                                                                                                                                                       |
| RF2.4  | Edição de metadados dos arquivos   | O sistema deve permitir que usuários autorizados editem informações e conteúdo de objetos existentes (por exemplo, renomear, atualizar descrições, adicionar tags)                                                                                                                                              |
| RF2.5  | Exclusão de arquivos               | O sistema deve permitir que usuários autorizados excluam objetos multimídia indesejados                                                                                                                                                                                                                         |
| RF2.6  | Miniatura de imagens               | Após o upload de uma imagem, o sistema deve gerar automaticamente uma miniatura (thumbnail)                                                                                                                                                                                                                     |
| RF2.7  | Miniatura em listagem de imagens   | A miniatura gerada deve ser usada para fins de visualização em listagens de imagens e outros contextos relevantes                                                                                                                                                                                               |
| RF2.8  | Miniatura de videos                | Após o upload de um vídeo, o sistema deve gerar automaticamente uma miniatura a partir do primeiro quadro do vídeo                                                                                                                                                                                              |
| RF2.9  | Miniatura em listagem de vídeos    | A miniatura gerada deve ser usada para fins de visualização em listagens de vídeos e outros contextos relevantes                                                                                                                                                                                                |
| RF2.10 | Resoluções de vídeo                | O sistema deve ser capaz de processar arquivos de vídeo enviados e criar versões adicionais com diferentes qualidades de vídeo, incluindo: 1080p, 720p e 480p                                                                                                                                                   |
| RF2.11 | Seleção de resolução de reprodução | Cada qualidade de vídeo gerada deve estar associada ao arquivo de vídeo original, permitindo que os usuários selecionem a qualidade desejada durante a reprodução. A resolução padrão ao carregar um vídeo selecionado será de 1080p                                                                            |
| RF2.12 | Propriedades da imagem             | Manter nome do arquivo, descrição, tags, tamanho do arquivo, data de upload, tipo do arquivo (por exemplo, image/jpeg, image/png), resolução e densidade em pixels, profundidade de cor, dados exif                                                                                                             |
| RF2.13 | Propriedades do Vídeo              | Manter nome do arquivo, descrição, tags, categoria, tamanho do arquivo, data de upload, tipo do arquivo ((por exemplo, video/mp4, video/avi), duração, resolução, taxa de quadros (frame por segundo), codec de vídeo (por exemplo, H.264, VP9), taxa de bits, localização da miniatura, versões de resoluções, |
| RF2.14 | Propriedades de áudio              | Manter nome do arquivo, descrição, tags, gêneros, tamanho do arquivo, data de upload, tipo do arquivo (por exemplo, áudio/mpeg, áudio/wav), duração, taxa de bits, taxa de amostragem, canais                                                                                                                   |

## 3. Funcionalidade de Pesquisa

| ID    | Nome                 | Descrição                                                                                                                       |
| ----- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| RF3.1 | Pesquisa de arquivos | O sistema deve permitir que os usuários pesquisem objetos multimídia usando palavras-chave relacionadas a descrição, nome, tags |
| RF3.2 | Campo de pesquisa    | O sistema deve exibir resultados de pesquisa com base nas palavras-chave inseridas                                              |

## 4. Funcionalidade de Listagem

| ID    | Nome                           | Descrição                                                                                                                                |
| ----- | ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| RF4.1 | Listagem de arquivos           | O sistema deve fornecer opções para listar todos os objetos multimídia no sistema                                                        |
| RF4.2 | Filtragem por tipo de arquivos | O sistema deve fornecer opções para listar objetos com base em seu tipo (imagens, áudio, vídeos)                                         |
| RF4.3 | Filtragem por palavras-chave   | O sistema deve permitir que os usuários combinem palavras-chave de pesquisa com opções de listagem para filtrar ainda mais os resultados |
## 5. Funcionalidade de Visualização

| ID    | Nome                                       | Descrição                                                                                                                                                                                                                           |
| ----- | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| RF5.1 | Seleção de arquivos listados               | O sistema deve permitir que os usuários selecionem um objeto de uma lista                                                                                                                                                           |
| RF5.2 | Exibição do conteúdo e detalhes do arquivo | O sistema deve exibir o conteúdo completo e os detalhes do objeto selecionado com base em seu tipo (por exemplo, exibir imagem para objeto de imagem, reproduzir áudio para objeto de áudio, reproduzir vídeo para objeto de vídeo) |