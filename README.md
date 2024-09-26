# Configurações de Terminal Personalizado

Este repositório contém minhas configurações do **Windows Terminal**, incluindo o uso do **PowerShell 7**, temas, fontes e ferramentas personalizadas. Aqui você encontrará instruções para replicar meu ambiente de desenvolvimento.

## Índice
1. [Instalação do PowerShell 7](#1-instalando-o-powershell-7)
2. [Configuração de Cores no Windows Terminal](#2-configurando-cores-no-windows-terminal)
   - [Configurar cores no `.json`](#21-configurar-cores-no-json)
3. [Instalação de Nerd Fonts](#3-instalando-nerd-fonts)
4. [Instalação do Chocolatey](#4-instalando-o-chocolatey)
   - [Instalando pacotes com Chocolatey](#5-instalando-pacotes-com-chocolatey)
   - [Configurando o LSD](#51-configurando-o-lsd)
5. [Instalação do Scoop](#6-instalando-o-scoop)
6. [Criando ou Usando um $PROFILE no PowerShell](#7-criando-ou-usando-um-profile-do-powershell)
7. [Instalação e Configuração do Oh-My-Posh](#8-instalando-e-usando-oh-my-posh)
8. [Instalação e Configuração do Starship](#9-instalando-configurando-e-usando-o-starship)
9. [Instalação e Configuração do posh-git](#10-instalando-e-configurando-o-posh-git)

## 1. Instalando o PowerShell 7

Para instalar o **PowerShell 7** no Windows, siga estas etapas:

1. Acesse a [página de lançamentos do PowerShell no GitHub](https://github.com/PowerShell/PowerShell/releases).
2. Baixe o instalador mais recente para Windows (arquivo `.msi`).
3. Execute o instalador e siga as instruções na tela.

**Alternativa usando Scoop**:

```powershell
scoop install pwsh
```

## 2. Configurando Cores no Windows Terminal

Para configurar cores no Windows Terminal com PowerShell 7:

1. Abra o Windows Terminal.
2. Clique na seta ao lado de uma aba e selecione "Configurações".
3. Vá até "esquema de cores" e selecione seu tema preferido.
4. Salve as alterações.

### 2.1. Configurar cores no `.json`

1. Em "Configurações", selecione "Abrir o arquivo JSON".
2. Procure o parâmetro `"schemes"` e personalize as cores de acordo com sua preferência.
3. Salve as alterações e reinicie o terminal.

## 3. Instalando Nerd Fonts

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

## 4. Instalando o Chocolatey

O **Chocolatey** é um gerenciador de pacotes para Windows. Para instalá-lo:

1. Abra o Windows Terminal como Administrador.
2. Execute o seguinte comando:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## 5. Instalando Pacotes com Chocolatey

Após instalar o **Chocolatey**, você pode instalar os pacotes essenciais com os comandos abaixo:

```powershell
choco install lsd git
```

**Alternativa usando Scoop**:

```powershell
scoop install lsd git
```

### 5.1. Configurando o LSD

Para configurar o `lsd`:

1. Crie e edite o arquivo `config.yaml` com o comando:
   ```powershell
   notepad $HOME\.config\lsd\config.yaml
   ```
2. Personalize de acordo com suas preferências.

Para mais informações, acesse o [repositório oficial do lsd](https://github.com/lsd-rs/lsd).

### 5.2. Instalações adicionais

Aqui estão alguns pacotes adicionais recomendados:

```powershell
choco install 7zip vim
```

**Alternativa usando Scoop**:

```powershell
scoop install neofetch 7zip vim
```

## 6. Instalando o Scoop

O **Scoop** é outra ferramenta de gerenciamento de pacotes. Para instalá-lo:

1. Execute o seguinte comando no Windows Terminal:
   ```powershell
   Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
   ```

## 7. Criando ou Usando um $PROFILE do PowerShell

Para criar ou editar seu perfil no PowerShell:

1. Abra o PowerShell e execute:
   ```powershell
   notepad $PROFILE
   ```
2. Adicione suas personalizações, como aliases ou funções.

## 8. Instalando e Usando Oh-My-Posh

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

## 9. Instalando, Configurando e Usando o Starship

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

3. Crie o arquivo de configuração:
   ```powershell
   notepad $HOME\.config\starship.toml
   ```

4. Adicione ao `$PROFILE` para carregar a configuração:
   ```powershell
   $ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
   ```

Para mais informações, consulte a [documentação oficial do Starship](https://starship.rs/config/).

## 10. Instalando e Configurando o posh-git

O **posh-git** é um módulo que exibe o estado dos repositórios Git no prompt do PowerShell.

### 10.1. Instalando o posh-git

- **Usando Chocolatey**:
  ```powershell
  choco install poshgit
  ```

- **Usando Scoop**:
  ```powershell
  scoop bucket add extras
  scoop install posh-git
  Add-PoshGitToProfile
  ```

### 10.2. Configurando o posh-git

Adicione a seguinte linha ao `$PROFILE`:

```powershell
Import-Module posh-git
```

Edite o perfil:

```powershell
notepad $PROFILE
```

### 10.3. Usando o posh-git

O `posh-git` exibe o estado do seu repositório diretamente no prompt, mostrando:
- Branch atual.
- Alterações locais.
- Indicadores de commits pendentes e merge conflicts.

Para mais detalhes, consulte a [documentação oficial do posh-git](https://github.com/dahlbyk/posh-git).

## Conclusão

Você configurou seu terminal do Windows com PowerShell 7, Nerd Fonts, Chocolatey, Scoop e outras ferramentas úteis. Explore e personalize conforme necessário!
