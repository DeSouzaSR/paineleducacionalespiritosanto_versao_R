# --- ETAPA 1: Esboço da Aplicação ---

# 1. Carregar as bibliotecas necessárias
# Se você não tiver alguma delas, instale com o comando: install.packages("nome_do_pacote")
library(shiny)
library(shinydashboard) # Pacote para criar painéis com menu lateral
library(readr)          # Para ler o arquivo CSV de forma eficiente

# 2. Leitura dos dados de amostra (será expandido nas próximas etapas)
# O caminho "data/..." funciona porque o app.R está na pasta raiz do projeto.
dados_escolas <- read_csv("data/amostra_escolas_es.csv")


# 3. Definição da Interface do Usuário (UI)
ui <- dashboardPage(
  
  # Cabeçalho da aplicação
  dashboardHeader(title = "Painel Educacional ES"),
  
  # Menu lateral (Sidebar)
  dashboardSidebar(
    sidebarMenu(
      # Cada 'menuItem' é um link no menu. O 'tabName' conecta o link ao seu conteúdo.
      menuItem("Apresentação", tabName = "apresentacao", icon = icon("home")),
      menuItem("Mapa Interativo", tabName = "mapa", icon = icon("map-marked-alt")),
      menuItem("Estatísticas da Escola", tabName = "estatisticas", icon = icon("chart-bar")),
      menuItem("Indicadores de Qualidade", tabName = "indicadores", icon = icon("tachometer-alt"))
    )
  ),
  
  # Corpo principal da aplicação
  dashboardBody(
    # 'tabItems' contém o conteúdo para cada um dos 'menuItem' definidos acima
    tabItems(
      # Conteúdo da Página 1: Apresentação
      tabItem(tabName = "apresentacao",
              fluidRow( # Usamos fluidRow e box para organizar o conteúdo
                box(
                  title = "📚 Painel de Dados Educacionais do Espírito Santo",
                  width = 12, # Ocupa a largura total (12 colunas)
                  solidHeader = TRUE,
                  status = "primary",
                  
                  h3("Objetivo do Projeto"),
                  p("O objetivo é criar um painel interativo para visualização e análise de dados sobre as escolas do estado do Espírito Santo. A aplicação permite explorar as escolas em um mapa, visualizar estatísticas detalhadas e consultar indicadores de qualidade educacional, como o IDEB."),
                  
                  h3("Fonte dos Dados"),
                  p("Os dados utilizados neste projeto são públicos e foram obtidos através do portal de microdados do Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP)."),
                  
                  tags$i("Navegue pelas seções no menu à esquerda para explorar os dados.")
                )
              )
      ),
      
      # Conteúdo da Página 2: Mapa (Placeholder)
      tabItem(tabName = "mapa",
              h2("📍 Mapa Interativo das Escolas"),
              p("Esta página está em construção. Em breve, você verá um mapa interativo com a geolocalização de todas as escolas do Espírito Santo.")
      ),
      
      # Conteúdo da Página 3: Estatísticas (Placeholder)
      tabItem(tabName = "estatisticas",
              h2("📊 Estatísticas das Escolas"),
              p("Esta página está em construção. Em breve, você poderá selecionar uma escola e visualizar suas principais estatísticas, como etapas de ensino, capacidade de alunos, etc.")
      ),
      
      # Conteúdo da Página 4: Indicadores (Placeholder)
      tabItem(tabName = "indicadores",
              h2("📈 Indicadores de Qualidade (IDEB)"),
              p("Esta página está em construção. Em breve, você poderá consultar os indicadores educacionais, como a nota do IDEB, para as escolas do estado.")
      )
    )
  )
)

# 4. Lógica do Servidor (Server)
# Por enquanto, esta função está vazia, pois não temos interatividade.
server <- function(input, output) {
  
}

# 5. Comando para rodar a aplicação Shiny
shinyApp(ui, server)