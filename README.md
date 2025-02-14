# 📺 Gerador de Listas IPTV - M3U8 & XMLTV

Este projeto automatiza a criação, edição e processamento de listas **M3U8** e **XMLTV** para **IPTV**. O sistema permite baixar, concatenar, organizar e atualizar listas de canais, além de gerenciar metadados como grupos, logos e EPGs.

## 📌 Funcionalidades

✅ **Download e concatenação de listas IPTV (M3U8)**  
✅ **Criação de grupos personalizados para os canais**  
✅ **Correção de URLs e remoção de canais duplicados**  
✅ **Geração de arquivos EPG no formato XMLTV**  
✅ **Envio automático para GitHub e AWS S3**  

---

## 🛠 Tecnologias Utilizadas

- **Linguagem:** R  
- **Pacotes R:** `tidyverse`, `readxl`, `httr`, `stringr`, `xml2`, `R.utils`  
- **Fontes de dados:** Listas IPTV públicas e arquivos XMLTV para EPG  

---

## 📂 Estrutura do Código

```
📁 /  (Diretório Raiz)
├── 000_main.R                                # Script principal de execução
├── 001_download_concatenacao_urls.R         # Baixa e concatena listas IPTV
├── 002_cria_music_salva_arquivo.R           # Organiza canais do gênero "Music"
├── 003_insere_canais_manualmente_concatena_resultados_buscados.R  # Insere canais manualmente
├── 004_cria_index_epg_no_m3u8.R             # Adiciona metadados do EPG no M3U8
├── 005_cria_grupos.R                        # Classifica canais em grupos
├── 006_double_check_canais.R                # Verifica e corrige erros na lista
├── 007_atribui_logo_remove_repetidos.R      # Atribui logos e remove duplicatas
├── 009_cria_xml.R                           # Gera arquivos EPG em XMLTV
├── 010_remove_grupo_omitir.R                # Remove canais indesejados
└── urls_geral.xlsx                          # Arquivo Excel com URLs e metadados
```

---

## 🚀 Como Executar

### 1️⃣ **Instalar os pacotes necessários**

Se ainda não estiverem instalados, execute no R:

```r
install.packages(c("tidyverse", "readxl", "httr", "stringr", "xml2", "R.utils"))
```

### 2️⃣ **Executar o script principal**

Para gerar uma lista IPTV completa:

```r
source("000_main.R")
```

Para baixar e concatenar URLs específicas:

```r
source("001_download_concatenacao_urls.R")
```

Para gerar um novo EPG:

```r
source("009_cria_xml.R")
```

### 3️⃣ **Configurar Envio para GitHub e AWS S3**

No script `000_main.R`, modifique:

- **Envio para GitHub**  
```r
github_windows("atualizacao_nome")
```

- **Envio para AWS S3**  
```r
aws.s3::put_object(file = "reduced.m3u8", object = "iptv/reduced.m3u8", bucket = "pira", region = "eu-north-1")
```

---

## 📊 Estrutura do Arquivo M3U8

A saída será um arquivo `.m3u8` com a seguinte estrutura:

```
#EXTM3U x-tvg-url="https://github.com/tenorioabs/thestreamremainsthesame/raw/main/reduced.xml.gz"
#EXTINF:-1 tvg-id="CNN.us" tvg-logo="https://logo-url.com/cnn.png" group-title="News", CNN USA
http://stream-url.com/cnn.m3u8
#EXTINF:-1 tvg-id="ESPN.us" tvg-logo="https://logo-url.com/espn.png" group-title="Sports", ESPN HD
http://stream-url.com/espn.m3u8
```

---

## 🛑 Possíveis Problemas e Soluções

### ⚠️ **Erro ao baixar listas IPTV**
Se um link estiver offline, tente substituir o URL no arquivo `urls_geral.xlsx`.

### 🔄 **Metadados do EPG não aparecem corretamente**
Se a grade de programação não carregar, verifique se a URL do **XMLTV** está correta:

```r
x-tvg-url="https://github.com/tenorioabs/thestreamremainsthesame/raw/main/reduced.xml.gz"
```

---

🚀 **Agora você pode gerar e organizar listas IPTV automaticamente!** Qualquer dúvida, me avise! 😊
