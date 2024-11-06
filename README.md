# Configurações de Terminal Personalizado

Este repositório contém minhas configurações do **Windows Terminal**, incluindo o uso do **PowerShell 7**, temas, fontes e ferramentas personalizadas. Aqui você encontrará instruções para replicar meu ambiente de desenvolvimento.

## Índice
1. [Instalação de Gerenciadores de Pacotes](#1-instalação-de-gerenciadores-de-pacotes)
   - [Instalação do Chocolatey](#11-instalando-o-chocolatey)
   - [Instalação do Scoop](#12-instalando-o-scoop)
2. [Instalando Pacotes com Chocolatey e Scoop](#2-instalando-pacotes-com-chocolatey-e-scoop)
   - [Instalando Pacotes](#21-instalando-pacotes)
   - [Configurando o LSD](#22-configurando-o-lsd)
3. [Instalação do PowerShell 7](#3-instalando-o-powershell-7)
4. [Instalação de Nerd Fonts](#4-instalando-nerd-fonts)
5. [Configuração de Cores no Windows Terminal](#5-configurando-cores-no-windows-terminal)
   - [Configurar cores no `.json`](#51-configurar-cores-no-json)
6. [Criando ou Usando um $PROFILE no PowerShell](#6-criando-ou-usando-um-profile-do-powershell)
7. [Instalação e Configuração do Oh-My-Posh](#7-instalando-e-usando-oh-my-posh)
8. [Instalação e Configuração do Starship](#8-instalando-configurando-e-usando-o-starship)
9. [Instalação e Configuração do posh-git](#9-instalando-e-configurando-o-posh-git)
10. [Instalação e Configuração do yasb](#10-instalando-e-configurando-o-yasb)
11. [Instalação e Configuração do komorebi](#11-instalando-e-configurando-o-komorebi)

---

## 1. Instalação de Gerenciadores de Pacotes

Primeiro, vamos instalar alguns gerenciadores de pacotes essenciais para facilitar o gerenciamento de ferramentas no Windows.

### 1.1. Instalando o Chocolatey

O **Chocolatey** é um gerenciador de pacotes para Windows. Para instalá-lo:

1. Abra o Windows Terminal como Administrador.
2. Execute o seguinte comando:

   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   ```

### 1.2. Instalando o Scoop

O **Scoop** é uma alternativa de gerenciamento de pacotes, focada em simplificar a instalação de programas no Windows.

1. Execute o seguinte comando no Windows Terminal:
   
   ```powershell
   Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
   ```

## 2. Instalando Pacotes com Chocolatey e Scoop

Após instalar o **Chocolatey** e o **Scoop**, você pode instalar pacotes essenciais. 

### 2.1. Instalando Pacotes

Use o Chocolatey para instalar alguns pacotes comuns:

```powershell
choco install lsd git
```

Ou, usando o Scoop:

```powershell
scoop install lsd git
```

### 2.2. Configurando o LSD

Para configurar o `lsd`, uma alternativa ao `ls` com recursos visuais adicionais:

1. Crie e edite o arquivo `config.yaml` com o comando:
   
   ```powershell
   notepad $HOME\.config\lsd\config.yaml
   ```

Para mais informações, acesse o [repositório oficial do lsd](https://github.com/lsd-rs/lsd).

## 3. Instalando o PowerShell 7

Para instalar o **PowerShell 7** no Windows:

1. Acesse a [página de lançamentos do PowerShell no GitHub](https://github.com/PowerShell/PowerShell/releases).
2. Baixe o instalador mais recente para Windows (arquivo `.msi`).
3. Execute o instalador e siga as instruções na tela.

**Alternativa usando Scoop**:

```powershell
scoop install pwsh
```

## 4. Instalando Nerd Fonts

As **Nerd Fonts** incluem ícones para enriquecer sua experiência no terminal.

1. Acesse a [página oficial no GitHub](https://github.com/ryanoasis/nerd-fonts#installing).
2. Siga as instruções para instalar sua fonte preferida.
3. Abra o Windows Terminal e configure a fonte em:

   ```
   Configurações > PowerShell > Aparência > Tipo de Fonte > Nerd Font
   ```

**Alternativa usando Scoop**:

```powershell
scoop bucket add nerd-fonts
scoop install JetBrains-Mono-NF
```

## 5. Configurando Cores no Windows Terminal

Para configurar cores no Windows Terminal com PowerShell 7:

1. Abra o Windows Terminal.
2. Clique na seta ao lado de uma aba e selecione "Configurações".
3. Vá até "esquema de cores" e selecione seu tema preferido.
4. Salve as alterações.

### 5.1. Configurar cores no `.json`

1. Em "Configurações", selecione "Abrir o arquivo JSON".
2. Procure o parâmetro `"schemes"` e personalize as cores de acordo com sua preferência.
3. Salve as alterações e reinicie o terminal.

## 6. Criando ou Usando um $PROFILE no PowerShell

Para criar ou editar seu perfil no PowerShell:

1. Abra o PowerShell e execute:
   
   ```powershell
   notepad $PROFILE
   ```

2. Adicione suas personalizações, como aliases ou funções.

## 7. Instalando e Usando Oh-My-Posh

O **Oh-My-Posh** é um gerenciador de temas para o PowerShell. Para instalá-lo:

1. Execute no PowerShell:

   ```powershell
   choco install oh-my-posh
   ```

**Alternativa usando Scoop**:

```powershell
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```

2. Adicione a inicialização ao `$PROFILE`:

   ```powershell
   oh-my-posh init pwsh --config '$HOME\AppData\Local\Programs\oh-my-posh\themes\theme.omp.json' | Invoke-Expression
   ```

## 8. Instalando, Configurando e Usando o Starship

O **Starship** é um prompt minimalista. Para instalá-lo:

1. Execute no PowerShell:

   ```powershell
   winget install starship
   ```

**Alternativa usando Chocolatey**:

```powershell
choco install starship
```

2. Adicione ao `$PROFILE`:

   ```powershell
   starship init powershell | Out-String | Invoke-Expression
   ```

## 9. Instalando e Configurando o posh-git

O **posh-git** é um módulo que exibe o estado dos repositórios Git no prompt do PowerShell.

### 9.1. Instalando o posh-git

**Usando Chocolatey**:

```powershell
choco install poshgit
```

**Usando Scoop**:

```powershell
scoop bucket add extras
scoop install posh-git
Add-PoshGitToProfile
```

### 9.2. Configurando o posh-git

Adicione a seguinte linha ao `$PROFILE`:

```powershell
Import-Module posh-git
```

## 10. Instalando e Configurando o yasb

O **yasb** (Yet Another Status Bar) é uma barra de status minimalista e personalizável para o Windows.

1. Acesse o repositório [yasb no GitHub](https://github.com/amnweb/yasb) e baixe a versão mais recente.
2. Extraia o conteúdo em uma pasta de sua escolha.
3. Configure o yasb editando os arquivos `config.yaml` e `styles.css` na sua pasta `.config` conforme suas preferências para temas e módulos.

Para mais instruções detalhadas, consulte a [documentação oficial do yasb](https://github.com/amnweb/yasb).

## 11. Instalando e Configurando o komorebi

O **komorebi** é um gerenciador de janelas para Windows que facilita o uso de tiling e organização de janelas automaticamente.

1. Acesse o [repositório do komorebi no GitHub](https://github.com/LGUG2Z/komorebi) e siga as instruções para download e instalação.
2. Para configurar, abra o arquivo `komorebi.json` na pasta `users/user` e ajuste as opções de layout e comportamento das janelas de acordo com suas preferências.

Para mais detalhes, consulte a [documentação oficial do komorebi](https://github.com/LGUG2Z/komorebi).

