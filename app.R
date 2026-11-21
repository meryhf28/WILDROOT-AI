#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

ui <- fluidPage(
  
  tags$head(
    tags$title("WILDROOT AI"),
    tags$style(HTML("
      body {
        background: #f4f7f1;
        font-family: Arial, sans-serif;
        color: #1f2d1f;
      }

      .hero {
        background: linear-gradient(135deg, #0f2f1f, #2f7d45, #a4c639);
        color: white;
        padding: 45px;
        border-radius: 26px;
        margin-bottom: 30px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.18);
      }

      .hero h1 {
        font-size: 52px;
        font-weight: 900;
        margin-bottom: 5px;
      }

      .hero h3 {
        font-size: 24px;
        font-weight: 400;
      }

      .card {
        background: white;
        padding: 28px;
        border-radius: 22px;
        margin-bottom: 25px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
      }

      .result {
        background: #eaf6e8;
        padding: 25px;
        border-radius: 22px;
        border-left: 8px solid #2f7d45;
      }

      .product {
        font-size: 36px;
        font-weight: 900;
        color: #1f6b38;
      }

      .metric {
        display: inline-block;
        background: white;
        border-radius: 16px;
        padding: 15px;
        margin: 8px;
        min-width: 150px;
        text-align: center;
        box-shadow: 0 3px 10px rgba(0,0,0,0.08);
      }

      .metric-number {
        font-size: 30px;
        font-weight: 900;
        color: #2f7d45;
      }

      .btn-primary {
        background-color: #2f7d45 !important;
        border-color: #2f7d45 !important;
        color: white !important;
        border-radius: 12px;
        font-weight: bold;
        padding: 12px 22px;
      }

      .tag {
        display: inline-block;
        background: #edf7e8;
        color: #245c35;
        padding: 8px 14px;
        border-radius: 20px;
        margin: 5px;
        font-weight: bold;
      }

      .mini-title {
        font-weight: 800;
        color: #245c35;
        margin-top: 10px;
      }

      .formula-box {
        background: #f8fbf5;
        border: 1px solid #dbead2;
        border-radius: 18px;
        padding: 18px;
        margin-bottom: 12px;
      }

      .strain-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
      }

      .strain-table th {
        background: #2f7d45;
        color: white;
        padding: 9px;
        text-align: left;
      }

      .strain-table td {
        padding: 9px;
        border-bottom: 1px solid #dbead2;
      }

      .note {
        font-size: 13px;
        color: #566356;
        font-style: italic;
      }

      .green-separator {
        background: #edf7e8;
        border-radius: 16px;
        padding: 18px;
        margin: 18px 0;
        border-left: 6px solid #2f7d45;
      }

      .green-separator h4 {
        margin-top: 0;
        color: #245c35;
        font-weight: 800;
      }

      .chat-bubble {
        position: fixed;
        bottom: 25px;
        right: 25px;
        width: 64px;
        height: 64px;
        background: linear-gradient(135deg, #1f6b38, #7fbf5b);
        color: white;
        border-radius: 50%;
        box-shadow: 0 8px 25px rgba(0,0,0,0.28);
        z-index: 9999;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 30px;
        cursor: pointer;
        transition: all 0.25s ease;
      }

      .chat-bubble:hover {
        transform: scale(1.08);
      }

      .floating-chat {
        display: none;
        position: fixed;
        bottom: 100px;
        right: 25px;
        width: 350px;
        background: white;
        border-radius: 22px;
        box-shadow: 0 8px 28px rgba(0,0,0,0.25);
        z-index: 9999;
        overflow: hidden;
        border: 1px solid #dbead2;
      }

      .chat-header {
        background: linear-gradient(135deg, #1f6b38, #7fbf5b);
        color: white;
        padding: 15px 18px;
        font-weight: 800;
        font-size: 16px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .chat-close {
        cursor: pointer;
        font-size: 20px;
        font-weight: bold;
      }

      .chat-body {
        padding: 18px;
        background: #f8fbf5;
      }

      .chat-small {
        font-size: 13px;
        color: #4a5c4a;
      }

      .chat-response {
        background:#eaf6e8;
        padding:12px;
        border-radius:14px;
        border-left:5px solid #2f7d45;
        margin-top: 12px;
      }
    ")),
    
    tags$script(HTML("
      $(document).on('click', '#openChat', function() {
        $('#chatWindow').fadeIn(200);
        $('#openChat').fadeOut(100);
      });

      $(document).on('click', '#closeChat', function() {
        $('#chatWindow').fadeOut(150);
        $('#openChat').fadeIn(200);
      });
    "))
  ),
  
  div(
    class = "hero",
    
    fluidRow(
      column(
        8,
        h1("WILDROOT AI"),
        h3("Biointeligencia de plantas silvestres para cultivos del futuro"),
        p("Plataforma inteligente de recomendación agronómica basada en levaduras beneficiosas, datos del cultivo e inteligencia artificial.")
      ),
      
      column(
        4,
        img(
          src = "logo_wildroot.png",
          style = "
    max-width: 230px;
    width: 100%;
    border-radius: 24px;
    padding: 0px;
    float: right;
    box-shadow: none;
  "
        )
      )
    )
  ),
  
  fluidRow(
    column(
      4,
      div(
        class = "card",
        h3("Diagnóstico del cultivo"),
        
        selectInput("cultivo", "Cultivo:", choices = c("Viñedo", "Hortícolas", "Frutales", "Vivero")),
        selectInput("suelo", "Tipo de suelo:", choices = c("Calizo", "Arcilloso", "Arenoso", "Pobre en materia orgánica", "Salino")),
        selectInput("problema", "Problema principal:", choices = c("Hongos", "Bajo crecimiento", "Estrés hídrico", "Mala absorción de nutrientes", "Trasplante")),
        selectInput("fase", "Fase del cultivo:", choices = c("Inicio vegetativo", "Floración", "Cuajado", "Maduración", "Postrasplante")),
        selectInput("clima", "Condición ambiental predominante:", choices = c("Normal", "Alta humedad", "Sequía", "Altas temperaturas", "Suelo empobrecido")),
        selectInput("aplicacion", "Vía de aplicación:", choices = c("Foliar", "Suelo/riego", "Raíz/trasplante")),
        
        sliderInput("superficie", "Superficie estimada (ha):", min = 1, max = 50, value = 5),
        sliderInput("riesgo", "Intensidad del problema detectado:", min = 1, max = 10, value = 6),
        
        checkboxInput("eco", "Producción ecológica", value = TRUE),
        actionButton("analizar", "Analizar con WILDROOT AI", class = "btn-primary")
      )
    ),
    
    column(
      8,
      div(
        class = "card",
        h3("Recomendación inteligente"),
        uiOutput("resultado")
      )
    )
  ),
  
  fluidRow(
    column(
      6,
      div(
        class = "card",
        h3("Perfil funcional de la formulación"),
        plotOutput("radarPlot", height = "430px"),
        hr(),
        h3("Evolución esperada tras la aplicación"),
        plotOutput("responsePlot", height = "390px")
      )
    ),
    
    column(
      6,
      div(
        class = "card",
        h3("Composición funcional propuesta"),
        uiOutput("composicion")
      )
    )
  ),
  
  fluidRow(
    column(
      6,
      div(
        class = "card",
        h3("¿Cómo funciona WILDROOT AI?"),
        tags$ol(
          tags$li("El usuario introduce datos del cultivo, suelo, fase fenológica, ambiente y problema agronómico."),
          tags$li("La plataforma cruza esta información con una base de datos de levaduras epífitas beneficiosas."),
          tags$li("La IA propone una formulación prototipo con cepas, proporciones y vía de aplicación."),
          tags$li("El sistema podrá mejorar progresivamente con nuevos ensayos, resultados de campo y validaciones experimentales.")
        )
      )
    ),
    
    column(
      6,
      div(
        class = "card",
        h3("Informe de recomendación"),
        p("La plataforma genera un informe resumido con la recomendación, formulación prototipo, justificación técnica y beneficios esperados."),
        downloadButton("descargar", "Descargar informe demo", class = "btn-primary")
      )
    )
  ),
  fluidRow(
    column(
      6,
      div(
        class = "card",
        h3("Soluciones WILDROOT"),
        div(class = "tag", "WILDROOT Grow"),
        div(class = "tag", "WILDROOT Shield"),
        div(class = "tag", "WILDROOT Stress"),
        div(class = "tag", "WILDROOT Nutri"),
        div(class = "tag", "WILDROOT Nursery"),
        p("Cada línea se orienta a una necesidad agronómica concreta: crecimiento, defensa, estrés, nutrición o trasplante.")
      )
    ),
    
    column(
      6,
      div(
        class = "card",
        h3("Sobre WILDROOT AI"),
        p("WILDROOT AI transforma microorganismos beneficiosos asociados a plantas silvestres en soluciones agrícolas inteligentes. La propuesta combina biotecnología microbiana, levaduras promotoras del crecimiento vegetal e inteligencia artificial para ofrecer recomendaciones personalizadas a agricultores, bodegas, cooperativas y viveros."),
        p(strong("Eslogan: "), "La inteligencia de las plantas silvestres al servicio de la agricultura del futuro.")
      )
    )
  ),
  
  div(id = "openChat", class = "chat-bubble", "💬"),
  
  div(
    id = "chatWindow",
    class = "floating-chat",
    div(
      class = "chat-header",
      span("Asistente WILDROOT AI"),
      span(id = "closeChat", class = "chat-close", "×")
    ),
    div(
      class = "chat-body",
      p(strong("Hola, somos WILDROOT AI.")),
      p(class = "chat-small", "Déjenos su mensaje y nuestro equipo revisará su consulta para orientarle sobre la solución biológica más adecuada."),
      textInput("nombre_contacto", NULL, placeholder = "Nombre"),
      textInput("email_contacto", NULL, placeholder = "Correo electrónico"),
      textAreaInput("mensaje_contacto", NULL, placeholder = "Escriba su consulta...", rows = 3),
      actionButton("enviar_consulta", "Enviar", class = "btn-primary"),
      uiOutput("respuesta_chat")
    )
  )
)

server <- function(input, output) {
  
  recomendacion <- eventReactive(input$analizar, {
    
    if (input$problema == "Hongos") {
      list(
        producto = "WILDROOT Shield",
        subtitulo = "Bioprotector frente a hongos fitopatógenos",
        descripcion = "Formulación prototipo diseñada para reducir la presión fúngica y complementar estrategias de protección vegetal.",
        motivo = "La IA prioriza las cepas con mayor potencial antifúngico, especialmente Pichia kudriavzevii C(A4) y Pichia kluyveri B(F8), combinadas con cepas de apoyo para competencia, sideróforos y persistencia.",
        beneficio = "Reducción de la presión fúngica y menor dependencia de fitosanitarios químicos.",
        dosis = "Aplicación foliar preventiva en fases sensibles del cultivo.",
        concentracion = "10⁷ UFC/mL",
        valores = c(72, 70, 98, 80, 86),
        respuesta = c(0, 25, 48, 68, 82, 90),
        eje_respuesta = "Nivel estimado de protección (%)",
        cepas = data.frame(
          especie = c("Pichia kudriavzevii", "Pichia kluyveri", "Metschnikowia pulcherrima", "Wickerhamomyces anomalus"),
          cepa = c("C(A4)", "B(F8)", "B(B5)", "B(H3.1.1)"),
          proporcion = c("35 %", "30 %", "20 %", "15 %"),
          funcion = c("Actividad antifúngica prioritaria", "Actividad antifúngica complementaria", "Sideróforos y competencia", "Refuerzo antagonista")
        ),
        mecanismos = c("Actividad antifúngica", "Competencia por nutrientes", "Sideróforos", "Enzimas hidrolíticas", "Bioprotección preventiva")
      )
    } else if (input$problema == "Bajo crecimiento") {
      list(
        producto = "WILDROOT Grow",
        subtitulo = "Biofertilizante promotor del crecimiento",
        descripcion = "Formulación prototipo orientada a estimular el crecimiento vegetal, el desarrollo radicular y el vigor inicial.",
        motivo = "La IA selecciona cepas con producción de IAA, amonio, biofilm y mecanismos asociados a promoción del crecimiento.",
        beneficio = "Mayor vigor inicial, mejor desarrollo radicular y crecimiento más uniforme.",
        dosis = "Aplicación en raíz o suelo al inicio del ciclo vegetativo.",
        concentracion = "10⁷ UFC/mL",
        valores = c(95, 82, 66, 72, 86),
        respuesta = c(0, 18, 38, 58, 74, 84),
        eje_respuesta = "Mejora estimada del vigor vegetal (%)",
        cepas = data.frame(
          especie = c("Meyerozyma caribbica", "Torulaspora delbrueckii", "Metschnikowia pulcherrima", "Wickerhamomyces anomalus"),
          cepa = c("A(F8.2)", "C(B8)", "B(B5)", "B(H3.1.1)"),
          proporcion = c("35 %", "30 %", "20 %", "15 %"),
          funcion = c("Estimulación vegetal", "Robustez fisiológica", "Apoyo nutricional", "Colonización y persistencia")
        ),
        mecanismos = c("Producción de IAA", "Producción de amonio", "ACC desaminasa", "Biofilm", "Estimulación radicular")
      )
    } else if (input$problema == "Estrés hídrico") {
      list(
        producto = "WILDROOT Stress",
        subtitulo = "Bioestimulante frente a sequía y calor",
        descripcion = "Formulación prototipo orientada a mejorar la respuesta del cultivo frente a sequía, calor y condiciones ambientales adversas.",
        motivo = "La IA recomienda cepas robustas asociadas a resiliencia ambiental, tolerancia fisiológica y apoyo al equilibrio del cultivo.",
        beneficio = "Mejor tolerancia al estrés y mayor estabilidad productiva.",
        dosis = "Aplicación preventiva antes de periodos de sequía o calor.",
        concentracion = "10⁷ UFC/mL",
        valores = c(74, 68, 70, 96, 84),
        respuesta = c(0, 15, 32, 55, 73, 86),
        eje_respuesta = "Mejora estimada de tolerancia al estrés (%)",
        cepas = data.frame(
          especie = c("Torulaspora delbrueckii", "Meyerozyma caribbica", "Pichia kudriavzevii", "Wickerhamomyces anomalus"),
          cepa = c("C(B8)", "A(F8.2)", "C(A4)", "B(H3.1.1)"),
          proporcion = c("35 %", "25 %", "25 %", "15 %"),
          funcion = c("Robustez ambiental", "Apoyo metabólico", "Persistencia en estrés", "Colonización y protección")
        ),
        mecanismos = c("Tolerancia osmótica", "Resiliencia térmica", "Biofilm protector", "ACC desaminasa", "Estimulación fisiológica")
      )
    } else if (input$problema == "Mala absorción de nutrientes") {
      list(
        producto = "WILDROOT Nutri",
        subtitulo = "Biofertilizante para movilización de nutrientes",
        descripcion = "Formulación prototipo diseñada para mejorar la disponibilidad de fósforo, zinc y potasio en el entorno radicular.",
        motivo = "La IA selecciona cepas con capacidad de solubilización de nutrientes, producción de metabolitos y mejora de la eficiencia nutricional.",
        beneficio = "Mayor eficiencia nutricional y reducción del uso de fertilizantes químicos.",
        dosis = "Aplicación en suelo o fertirriego al inicio de la demanda nutricional.",
        concentracion = "10⁷ UFC/mL",
        valores = c(78, 96, 64, 68, 80),
        respuesta = c(0, 20, 42, 63, 78, 88),
        eje_respuesta = "Mejora estimada de disponibilidad nutricional (%)",
        cepas = data.frame(
          especie = c("Meyerozyma caribbica", "Metschnikowia pulcherrima", "Torulaspora delbrueckii", "Wickerhamomyces anomalus"),
          cepa = c("A(F8.2)", "B(B5)", "C(B8)", "B(H3.1.1)"),
          proporcion = c("30 %", "25 %", "25 %", "20 %"),
          funcion = c("Solubilización nutricional", "Sideróforos", "Apoyo fisiológico", "Competencia y persistencia")
        ),
        mecanismos = c("Solubilización de fósforo", "Solubilización de zinc", "Solubilización de potasio", "Sideróforos", "Ácidos orgánicos")
      )
    } else {
      list(
        producto = "WILDROOT Nursery",
        subtitulo = "Inoculante para viveros y trasplantes",
        descripcion = "Formulación prototipo diseñada para favorecer la implantación temprana, la colonización radicular y la reducción del estrés postrasplante.",
        motivo = "La IA prioriza cepas con capacidad de formar biofilm, colonizar la raíz y favorecer el establecimiento temprano de la planta.",
        beneficio = "Menor estrés postrasplante y mejor implantación.",
        dosis = "Baño radicular o aplicación localizada en bandeja de cultivo.",
        concentracion = "10⁷ UFC/mL",
        valores = c(88, 75, 66, 78, 96),
        respuesta = c(0, 22, 45, 64, 80, 90),
        eje_respuesta = "Mejora estimada de implantación (%)",
        cepas = data.frame(
          especie = c("Meyerozyma caribbica", "Torulaspora delbrueckii", "Metschnikowia pulcherrima", "Wickerhamomyces anomalus"),
          cepa = c("A(F8.2)", "C(B8)", "B(B5)", "B(H3.1.1)"),
          proporcion = c("30 %", "25 %", "25 %", "20 %"),
          funcion = c("Implantación inicial", "Robustez fisiológica", "Apoyo protector", "Colonización y persistencia")
        ),
        mecanismos = c("Biofilm", "Colonización radicular", "Producción de IAA", "Reducción del estrés postrasplante", "Mejor implantación")
      )
    }
  })
  
  metricas <- reactive({
    rec <- recomendacion()
    if (is.null(rec)) return(NULL)
    
    compatibilidad <- ifelse(input$problema == "Hongos", 95,
                             ifelse(input$problema == "Bajo crecimiento", 91,
                                    ifelse(input$problema == "Estrés hídrico", 89,
                                           ifelse(input$problema == "Mala absorción de nutrientes", 88, 90))))
    
    ahorro <- ifelse(input$eco, 32, 24) + round(input$riesgo / 3)
    rendimiento <- ifelse(input$problema == "Bajo crecimiento", 18,
                          ifelse(input$problema == "Mala absorción de nutrientes", 15, 12))
    co2 <- ifelse(input$eco, 28, 18)
    
    list(compatibilidad = compatibilidad, ahorro = ahorro, rendimiento = rendimiento, co2 = co2)
  })
  
  output$resultado <- renderUI({
    rec <- recomendacion()
    met <- metricas()
    
    if (is.null(rec)) {
      return(div(
        p("Introduce los datos del cultivo y pulsa el botón para obtener una recomendación."),
        p(strong("Ejemplo recomendado para la demo: "), "Viñedo + suelo calizo + hongos + alta humedad.")
      ))
    }
    
    div(
      class = "result",
      div(class = "product", rec$producto),
      h4(rec$subtitulo),
      p(rec$descripcion),
      
      div(class = "metric", div(class = "metric-number", paste0(met$compatibilidad, "%")), div("compatibilidad")),
      div(class = "metric", div(class = "metric-number", paste0(met$ahorro, "%")), div("ahorro en insumos")),
      div(class = "metric", div(class = "metric-number", paste0(met$rendimiento, "%")), div("mejora potencial")),
      div(class = "metric", div(class = "metric-number", paste0(met$co2, "%")), div("reducción impacto")),
      
      hr(),
      p(strong("Cultivo analizado: "), input$cultivo),
      p(strong("Tipo de suelo: "), input$suelo),
      p(strong("Problema detectado: "), input$problema),
      p(strong("Fase del cultivo: "), input$fase),
      p(strong("Condición ambiental: "), input$clima),
      p(strong("Vía de aplicación recomendada: "), input$aplicacion),
      p(strong("Plan de aplicación: "), rec$dosis),
      p(
        strong("Motivo de la recomendación: "),
        HTML(
          gsub(
            "Pichia kluyveri",
            "<em>Pichia kluyveri</em>",
            gsub(
              "Pichia kudriavzevii",
              "<em>Pichia kudriavzevii</em>",
              rec$motivo
            )
          )
        )
      ),
      p(strong("Beneficio esperado: "), rec$beneficio)
    )
  })
  
  output$composicion <- renderUI({
    rec <- recomendacion()
    
    if (is.null(rec)) {
      return(p("La composición funcional aparecerá tras ejecutar el análisis."))
    }
    
    tagList(
      div(class = "formula-box",
          p(class = "mini-title", "Tipo de formulación"),
          p("Consorcio multicepa de levaduras epífitas de origen silvestre, seleccionado mediante inteligencia artificial a partir de una colección propia de cepas caracterizadas funcional y molecularmente.")
      ),
      
      div(class = "formula-box",
          p(class = "mini-title", "Composición prototipo"),
          tags$table(
            class = "strain-table",
            tags$tr(
              tags$th("Especie"),
              tags$th("Cepa"),
              tags$th("Proporción"),
              tags$th("Función principal")
            ),
            lapply(1:nrow(rec$cepas), function(i) {
              tags$tr(
                tags$td(tags$em(rec$cepas$especie[i])),
                tags$td(rec$cepas$cepa[i]),
                tags$td(rec$cepas$proporcion[i]),
                tags$td(rec$cepas$funcion[i])
              )
            })
          )
      ),
      
      div(class = "formula-box",
          p(class = "mini-title", "Concentración orientativa"),
          p(rec$concentracion, " como concentración inicial de trabajo, ajustable según cultivo, estabilidad, compatibilidad entre cepas y vía de aplicación.")
      ),
      
      div(class = "formula-box",
          p(class = "mini-title", "Mecanismos priorizados"),
          tags$ul(lapply(rec$mecanismos, tags$li))
      ),
      
      p(class = "note", "Nota: las proporciones mostradas corresponden a una formulación prototipo generada por WILDROOT AI. La composición final se optimizará experimentalmente antes de su transferencia comercial.")
    )
  })
  
  output$radarPlot <- renderPlot({
    rec <- recomendacion()
    
    if (is.null(rec)) {
      plot.new()
      text(0.5, 0.5, "Ejecuta el análisis para visualizar el perfil funcional.")
      return()
    }
    
    categorias <- c("Crecimiento", "Nutrición", "Bioprotección", "Estrés", "Colonización")
    df <- data.frame(categoria = factor(categorias, levels = categorias), valor = rec$valores)
    
    ggplot(df, aes(x = categoria, y = valor, group = 1)) +
      geom_polygon(fill = "#7fbf5b", alpha = 0.35, color = "#2f7d45", linewidth = 1.2) +
      geom_point(size = 4, color = "#2f7d45") +
      coord_polar(clip = "off") +
      ylim(-20, 100) +
      theme_minimal(base_size = 14) +
      labs(title = paste("Perfil funcional:", rec$producto), x = "", y = "") +
      theme(
        plot.title = element_text(face = "bold", hjust = 0.5),
        axis.text.y = element_blank(),
        axis.text.x = element_text(size = 12),
        panel.grid.major = element_line(color = "#d9e8d2"),
        plot.margin = margin(t = 35, r = 80, b = 35, l = 80)
      )
  })
  
  output$responsePlot <- renderPlot({
    rec <- recomendacion()
    
    if (is.null(rec)) {
      plot.new()
      text(0.5, 0.5, "Ejecuta el análisis para visualizar la evolución esperada.")
      return()
    }
    
    df <- data.frame(
      semana = c(0, 1, 2, 3, 4, 5),
      respuesta = rec$respuesta
    )
    
    ggplot(df, aes(x = semana, y = respuesta)) +
      geom_line(linewidth = 1.5, color = "#2f7d45") +
      geom_point(size = 4, color = "#2f7d45") +
      geom_area(fill = "#7fbf5b", alpha = 0.25) +
      ylim(0, 100) +
      theme_minimal(base_size = 14) +
      labs(
        title = "Respuesta esperada durante las primeras semanas",
        x = "Semanas tras la aplicación",
        y = rec$eje_respuesta
      ) +
      theme(
        plot.title = element_text(face = "bold", hjust = 0.5),
        panel.grid.minor = element_blank()
      )
  })
  
  output$respuesta_chat <- renderUI({
    if (input$enviar_consulta == 0) return(NULL)
    
    div(
      class = "chat-response",
      strong("Mensaje recibido."),
      p("Gracias por contactar con WILDROOT AI. Revisaremos su consulta y le responderemos lo antes posible.")
    )
  })
  
  output$descargar <- downloadHandler(
    filename = function() {
      paste0("Informe_WILDROOT_AI_", Sys.Date(), ".txt")
    },
    content = function(file) {
      rec <- recomendacion()
      met <- metricas()
      
      if (is.null(rec)) {
        writeLines("Ejecute primero el análisis en WILDROOT AI.", file)
      } else {
        cepas_txt <- apply(rec$cepas, 1, function(x) {
          paste0(x["especie"], " ", x["cepa"], " - ", x["proporcion"], " - ", x["funcion"])
        })
        
        texto <- c(
          "INFORME WILDROOT AI",
          "-------------------",
          paste("Fecha:", Sys.Date()),
          "",
          paste("Cultivo:", input$cultivo),
          paste("Tipo de suelo:", input$suelo),
          paste("Problema agronómico:", input$problema),
          paste("Fase del cultivo:", input$fase),
          paste("Condición ambiental:", input$clima),
          paste("Superficie:", input$superficie, "ha"),
          paste("Vía de aplicación:", input$aplicacion),
          "",
          paste("Producto recomendado:", rec$producto),
          paste("Descripción:", rec$descripcion),
          paste("Plan de aplicación:", rec$dosis),
          paste("Concentración orientativa:", rec$concentracion),
          "",
          "Composición prototipo:",
          cepas_txt,
          "",
          paste("Compatibilidad estimada:", paste0(met$compatibilidad, "%")),
          paste("Ahorro potencial en insumos:", paste0(met$ahorro, "%")),
          paste("Mejora potencial:", paste0(met$rendimiento, "%")),
          paste("Reducción de impacto ambiental:", paste0(met$co2, "%")),
          "",
          paste("Motivo de la recomendación:", rec$motivo),
          paste("Beneficio esperado:", rec$beneficio),
          "",
          "Nota: las proporciones mostradas corresponden a una formulación prototipo generada por WILDROOT AI."
        )
        
        writeLines(texto, file)
      }
    }
  )
}

shinyApp(ui = ui, server = server)