setwd('~/Dropbox/code/skeeball')

library(shiny)
library(ggplot2)
library(tidyverse)

source('shiny_skee/helpers.R')
matchup_results <- readRDS('shiny_skee/data/matchup_results.rds')
plot_names_df <- readRDS('shiny_skee/data/plot_names_df.rds')
sim_results <- readRDS('shiny_skee/data/sim_results.rds')
team_means <- readRDS('shiny_skee/data/team_means.rds')


# Define UI ----
ui <- fluidPage(
  titlePanel("SkeeBoston Skeeson 19 Team Playoff Bracket"),
  fluidRow(
    column(12,
           img(src = 'skeeboston_banner.jpg', width='100%')
           )
  ),
  fluidRow(
    
    column(2,
           wellPanel(
             helpText(p("Select winners for each match to display on the bracket. Reload the page to reset values.")
             ),
             selectInput("rd_0.1", label="0-1", 
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 14],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 19])
                           ),
             selectInput("rd_0.2", label="0-2", 
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 15],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 18])
                         
             ),
             selectInput("rd_0.3", label="0-3", 
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 16],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 17])
             ),
             selectInput("rd_1.1", label="1-1", 
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 1],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 16])
             ),
             selectInput("rd_1.2", label="1-2", 
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 2],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 15])
             ),
             selectInput("rd_1.3", label="1-3", 
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 3],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 14])
             ),
             selectInput("rd_1.4", label="1-4",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 4],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 13])
             ),
             selectInput("rd_1.5", label="1-5",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 5],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 12])
             ),
             selectInput("rd_1.6", label="1-6",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 6],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 11])
             ),
             selectInput("rd_1.7", label="1-7",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 7],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 10])
             ),
             selectInput("rd_1.8", label="1-8",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 8],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 9])
             ),
             selectInput("rd_2.1", label="2-1",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 1],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 8])
             ),
             selectInput("rd_2.2", label="2-2",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 2],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 7])
             ),
             selectInput("rd_2.3", label="2-3",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 3],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 6])
             ),
             selectInput("rd_2.4", label="2-4",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 4],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 5])
             ),
             selectInput("rd_3.1", label="3-1",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 1],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 4])
             ),
             selectInput("rd_3.2", label="3-2",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 2],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 3])
             ),
             selectInput("rd_4.1", label="4-1",
                         choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 1],
                                     reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 2])
             )
             # uiOutput('bs0.1'),
             # uiOutput('bs0.2'),
             # uiOutput('bs0.3'),
             # uiOutput('bs1.1'),
             # uiOutput('bs1.2'),
             # uiOutput('bs1.3'),
             # uiOutput('bs1.4'),
             # uiOutput('bs1.5'),
             # uiOutput('bs1.6'),
             # uiOutput('bs1.7'),
             # uiOutput('bs1.8'),
             # uiOutput('bs2.1'),
             # uiOutput('bs2.2'),
             # uiOutput('bs2.3'),
             # uiOutput('bs2.4'),
             # uiOutput('bs3.1'),
             # uiOutput('bs3.2'),
             # uiOutput('bs4.1')
           )
    ),
  column(10, 
         h3('Skeeson 19 Playoff Bracket'),
         plotOutput('bracket', height='800px')
  )),
  fluidRow(
    column(4),
    column(4,
           h3("Simulated team outcomes"),
           plotOutput('outcome_sim'),
           br(),
           selectInput('outcome_sim_select', 
                       label='Select a team',
                       choices = c('', unique(plot_names_df$team_name)))
           
    ),
    column(4)
  ),
  fluidRow(
         strong('Methods details'),
         p("Each individual player's results over the course of the skeeson were modeled as a normal distribution, and mean and standard deviation were calculated accordingly."),
         p("For chances of winning in bracket matches (top graph), 1,000 matches were simulated between each pair of opposing teams, drawing team scores randomly based on the players' underlying score distributions. The likelihood of winning was represented as a percentage based on these simulated matches."),
         p("For likely outcomes (bottom graph), the bracket was simulated 1,000 times, with each team score at each round drawn randomly based on each player's normally distributed scores. The final round that each team made was recorded at the end of each simulation and aggregated to generate the probabilities shown.")
  )
)


# Define server logic ----
server <- function(input, output, session) {
  reactive_plot_names <- plot_names_df
  # output$bs0.1 <- renderUI({
  #   selectInput("rd_0.1", label="0-1", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 14],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 19])
  #   )})
  # output$bs0.2 <- renderUI({
  #   selectInput("rd_0.2", label="0-2", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 15],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 18])
  #   )})
  # output$bs0.3 <- renderUI({
  #   selectInput("rd_0.3", label="0-3", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 16],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 0 & reactive_plot_names$bracket_id == 17])
  #   )})
  # output$bs1.1 <- renderUI({
  #   selectInput("rd_1.1", label="1-1", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 1],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 16])
  #   )})
  # output$bs1.2 <- renderUI({
  #   selectInput("rd_1.2", label="1-2", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 2],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 15])
  #   )})
  # output$bs1.3 <- renderUI({
  #   selectInput("rd_1.3", label="1-3", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 3],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 14])
  #   )})
  # output$bs1.4 <- renderUI({
  #   selectInput("rd_1.4", label="1-4", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 4],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 13])
  #   )})
  # output$bs1.5 <- renderUI({
  #   selectInput("rd_1.5", label="1-5", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 5],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 12])
  #   )})
  # output$bs1.6 <- renderUI({
  #   selectInput("rd_1.6", label="1-6", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 6],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 11])
  #   )})
  # output$bs1.7 <- renderUI({
  #   selectInput("rd_1.7", label="1-7", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 7],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 10])
  #   )})
  # output$bs1.8 <- renderUI({
  #   selectInput("rd_1.8", label="1-8", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 8],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 9])
  #   )})
  # output$bs2.1 <- renderUI({
  #   selectInput("rd_2.1", label="2-1", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 1],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 8])
  #   )})
  # output$bs2.2 <- renderUI({
  #   selectInput("rd_2.2", label="2-2", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 2],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 7])
  #   )})
  # output$bs2.3 <- renderUI({
  #   selectInput("rd_2.3", label="2-3", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 3],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 6])
  #   )})
  # output$bs2.4 <- renderUI({
  #   selectInput("rd_2.4", label="2-4", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 4],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 5])
  #   )})
  # output$bs3.1 <- renderUI({
  #   selectInput("rd_3.1", label="3-1", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 1],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 4])
  #   )})
  # output$bs3.2 <- renderUI({
  #   selectInput("rd_3.2", label="3-2", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 2],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 3])
  #   )})
  # output$bs4.1 <- renderUI({
  #   selectInput("rd_4.1", label="4-1", 
  #               choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 1],
  #                           reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 2])
  #   )})
  # 
# plot the matchup bracket
  observe({
    
    if (input$rd_0.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 14] <- input$rd_0.1
      reactive_plot_names$team_no[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 14] <- get_team_number(team_means, input$rd_0.1)
    }
    
    if (input$rd_0.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 15] <- input$rd_0.2
      reactive_plot_names$team_no[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 15] <- get_team_number(team_means, input$rd_0.2)
    }
    
    if (input$rd_0.3 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 16] <- input$rd_0.3
      reactive_plot_names$team_no[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 16] <- get_team_number(team_means, input$rd_0.3)
    }
    
    if (input$rd_1.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 1] <- input$rd_1.1
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_1.1)
    }
    if (input$rd_1.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 2] <- input$rd_1.2
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 2] <- get_team_number(team_means, input$rd_1.2)
    }
    
    if (input$rd_1.3 != ' '){  
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 3] <- input$rd_1.3
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 3] <- get_team_number(team_means, input$rd_1.3)
    }
    
    if (input$rd_1.4 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 4] <- input$rd_1.4
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 4] <- get_team_number(team_means, input$rd_1.4)
    }
    
    if (input$rd_1.5 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 5] <- input$rd_1.5
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 5] <- get_team_number(team_means, input$rd_1.5)
    }
    
    if (input$rd_1.6 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 6] <- input$rd_1.6
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 6] <- get_team_number(team_means, input$rd_1.6)
    }
    
    if (input$rd_1.7 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 7] <- input$rd_1.7
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 7] <- get_team_number(team_means, input$rd_1.7)
    }
    
    if (input$rd_1.8 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 8] <- input$rd_1.8
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 8] <- get_team_number(team_means, input$rd_1.8)
    }
    
    if (input$rd_2.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 1] <- input$rd_2.1
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_2.1)
    }
    
    if (input$rd_2.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 2] <- input$rd_2.2
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 2] <- get_team_number(team_means, input$rd_2.2)
    }
    
    if (input$rd_2.3 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 3] <- input$rd_2.3
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 3] <- get_team_number(team_means, input$rd_2.3)
    }
    
    if (input$rd_2.4 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 4] <- input$rd_2.4
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 4] <- get_team_number(team_means, input$rd_2.4)
    }
    
    if (input$rd_3.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 1] <- input$rd_3.1
      reactive_plot_names$team_no[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_3.1)
    }
    
    if (input$rd_3.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 2] <- input$rd_3.2
      reactive_plot_names$team_no[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 2] <- get_team_number(team_means, input$rd_3.2)
    }
    
    if (input$rd_4.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 5 & reactive_plot_names$bracket_id == 1] <- input$rd_4.1
      reactive_plot_names$team_no[reactive_plot_names$round == 5 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_4.1)
    }
    
    updateSelectInput(session, "rd_1.1", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 1],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 16]),
                      selected = input$rd_1.1)
    updateSelectInput(session, "rd_1.2", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 2],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 15]),
                      selected = input$rd_1.2)
    updateSelectInput(session, "rd_1.3", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 3],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 14]),
                      selected = input$rd_1.3)
    updateSelectInput(session, "rd_1.4", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 4],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 13]),
                      selected = input$rd_1.4)
    updateSelectInput(session, "rd_1.5", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 5],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 12]),
                      selected = input$rd_1.5)
    updateSelectInput(session, "rd_1.6", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 6],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 11]),
                      selected = input$rd_1.6)
    updateSelectInput(session, "rd_1.7", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 7],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 10]),
                      selected = input$rd_1.7)
    updateSelectInput(session, "rd_1.8", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 8],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 9]),
                      selected = input$rd_1.8)
    updateSelectInput(session, "rd_2.1", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 1],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 8]),
                      selected = input$rd_2.1)
    updateSelectInput(session, "rd_2.2", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 2],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 7]),
                      selected = input$rd_2.2)
    updateSelectInput(session, "rd_2.3", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 3],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 6]),
                      selected = input$rd_2.3)
    updateSelectInput(session, "rd_2.4", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 4],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 5]),
                      selected = input$rd_2.4)
    updateSelectInput(session, "rd_3.1", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 1],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 4]),
                      selected = input$rd_3.1)
    updateSelectInput(session, "rd_3.2", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 2],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 3]),
                      selected = input$rd_3.2)
    updateSelectInput(session, "rd_4.1", 
                      choices = c(" ", reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 1],
                                  reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 2]),
                      selected = input$rd_4.1)
    })
  output$bracket <- renderPlot({
    if (input$rd_0.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 14] <- input$rd_0.1
      reactive_plot_names$team_no[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 14] <- get_team_number(team_means, input$rd_0.1)
    }
    
    if (input$rd_0.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 15] <- input$rd_0.2
      reactive_plot_names$team_no[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 15] <- get_team_number(team_means, input$rd_0.2)
    }
    
    if (input$rd_0.3 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 16] <- input$rd_0.3
      reactive_plot_names$team_no[reactive_plot_names$round == 1 & reactive_plot_names$bracket_id == 16] <- get_team_number(team_means, input$rd_0.3)
    }
    
    if (input$rd_1.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 1] <- input$rd_1.1
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_1.1)
    }
    if (input$rd_1.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 2] <- input$rd_1.2
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 2] <- get_team_number(team_means, input$rd_1.2)
    }
    
    if (input$rd_1.3 != ' '){  
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 3] <- input$rd_1.3
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 3] <- get_team_number(team_means, input$rd_1.3)
    }
    
    if (input$rd_1.4 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 4] <- input$rd_1.4
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 4] <- get_team_number(team_means, input$rd_1.4)
    }
    
    if (input$rd_1.5 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 5] <- input$rd_1.5
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 5] <- get_team_number(team_means, input$rd_1.5)
    }
    
    if (input$rd_1.6 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 6] <- input$rd_1.6
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 6] <- get_team_number(team_means, input$rd_1.6)
    }
    
    if (input$rd_1.7 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 7] <- input$rd_1.7
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 7] <- get_team_number(team_means, input$rd_1.7)
    }
    
    if (input$rd_1.8 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 8] <- input$rd_1.8
      reactive_plot_names$team_no[reactive_plot_names$round == 2 & reactive_plot_names$bracket_id == 8] <- get_team_number(team_means, input$rd_1.8)
    }
    
    if (input$rd_2.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 1] <- input$rd_2.1
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_2.1)
    }
    
    if (input$rd_2.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 2] <- input$rd_2.2
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 2] <- get_team_number(team_means, input$rd_2.2)
    }
    
    if (input$rd_2.3 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 3] <- input$rd_2.3
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 3] <- get_team_number(team_means, input$rd_2.3)
    }
    
    if (input$rd_2.4 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 4] <- input$rd_2.4
      reactive_plot_names$team_no[reactive_plot_names$round == 3 & reactive_plot_names$bracket_id == 4] <- get_team_number(team_means, input$rd_2.4)
    }
    
    if (input$rd_3.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 1] <- input$rd_3.1
      reactive_plot_names$team_no[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_3.1)
    }
    
    if (input$rd_3.2 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 2] <- input$rd_3.2
      reactive_plot_names$team_no[reactive_plot_names$round == 4 & reactive_plot_names$bracket_id == 2] <- get_team_number(team_means, input$rd_3.2)
    }
    
    if (input$rd_4.1 != ' '){
      reactive_plot_names$team_name[reactive_plot_names$round == 5 & reactive_plot_names$bracket_id == 1] <- input$rd_4.1
      reactive_plot_names$team_no[reactive_plot_names$round == 5 & reactive_plot_names$bracket_id == 1] <- get_team_number(team_means, input$rd_4.1)
    }
    plot_bracket(reactive_plot_names, matchup_results)
  })
  
  # plot the outcome simulation results
  output$outcome_sim <- renderPlot({
    team_no <- team_means$team_no[team_means$Team == input$outcome_sim_select]
    plot_outcomes(sim_results, team_no)
  })
  
}

# Run the app ----
shinyApp(ui = ui, server = server)