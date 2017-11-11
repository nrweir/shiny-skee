library(scales)
plot_bracket <- function(plot_names_df, matchup_results){
  m_0.1_pcts = get_pcts(matchup_results, plot_names_df, '0-1')
  m_0.2_pcts = get_pcts(matchup_results, plot_names_df, '0-2')
  m_0.3_pcts = get_pcts(matchup_results, plot_names_df, '0-3')
  m_1.1_pcts = get_pcts(matchup_results, plot_names_df, '1-1')
  m_1.2_pcts = get_pcts(matchup_results, plot_names_df, '1-2')
  m_1.3_pcts = get_pcts(matchup_results, plot_names_df, '1-3')
  m_1.4_pcts = get_pcts(matchup_results, plot_names_df, '1-4')
  m_1.5_pcts = get_pcts(matchup_results, plot_names_df, '1-5')
  m_1.6_pcts = get_pcts(matchup_results, plot_names_df, '1-6')
  m_1.7_pcts = get_pcts(matchup_results, plot_names_df, '1-7')
  m_1.8_pcts = get_pcts(matchup_results, plot_names_df, '1-8')
  m_2.1_pcts = get_pcts(matchup_results, plot_names_df, '2-1')
  m_2.2_pcts = get_pcts(matchup_results, plot_names_df, '2-2')
  m_2.3_pcts = get_pcts(matchup_results, plot_names_df, '2-3')
  m_2.4_pcts = get_pcts(matchup_results, plot_names_df, '2-4')
  m_3.1_pcts = get_pcts(matchup_results, plot_names_df, '3-1')
  m_3.2_pcts = get_pcts(matchup_results, plot_names_df, '3-2')
  m_4.1_pcts = get_pcts(matchup_results, plot_names_df, '4-1')
  m_4.1_pcts = get_pcts(matchup_results, plot_names_df, '4-1')
  ggplot() +
    # bottom half of the bracket
    geom_segment(aes(x=0, y=6.5, xend=2, yend=6.5)) +
    geom_segment(aes(x=0, y=5.5, xend=2, yend=5.5)) +
    geom_segment(aes(x=2, y=0, xend=4, yend=0)) +
    geom_segment(aes(x=2, y=1, xend=4, yend=1)) +
    geom_segment(aes(x=2, y=2, xend=4, yend=2)) +
    geom_segment(aes(x=2, y=3, xend=4, yend=3)) +
    geom_segment(aes(x=2, y=4, xend=4, yend=4)) +
    geom_segment(aes(x=2, y=5, xend=4, yend=5)) +
    geom_segment(aes(x=2, y=6, xend=4, yend=6)) +
    geom_segment(aes(x=2, y=7, xend=4, yend=7)) +
    geom_segment(aes(x=4, y=0.5, xend=6, yend=0.5)) +
    geom_segment(aes(x=4, y=2.5, xend=6, yend=2.5)) +
    geom_segment(aes(x=4, y=4.5, xend=6, yend=4.5)) +
    geom_segment(aes(x=4, y=6.5, xend=6, yend=6.5)) +
    geom_segment(aes(x=6, y=1.5, xend=8, yend=1.5)) +
    geom_segment(aes(x=6, y=5.5, xend=8, yend=5.5)) +
    geom_segment(aes(x=8, y=3.5, xend=10, yend=3.5)) +
    geom_segment(aes(x=2, y=5.5, xend=2, yend=6.5)) +
    geom_segment(aes(x=4, y=0, xend=4, yend=1)) +
    geom_segment(aes(x=4, y=2, xend=4, yend=3)) +
    geom_segment(aes(x=4, y=4, xend=4, yend=5)) +
    geom_segment(aes(x=4, y=6, xend=4, yend=7)) +
    geom_segment(aes(x=6, y=0.5, xend=6, yend=2.5)) +
    geom_segment(aes(x=6, y=4.5, xend=6, yend=6.5)) +
    geom_segment(aes(x=8, y=1.5, xend=8, yend=5.5)) +
    # top half of the bracket
    geom_segment(aes(x=0, y=14, xend=2, yend=14)) +
    geom_segment(aes(x=0, y=13, xend=2, yend=13)) +
    geom_segment(aes(x=0, y=10, xend=2, yend=10)) +
    geom_segment(aes(x=0, y=9, xend=2, yend=9)) +
    geom_segment(aes(x=2, y=7.5, xend=4, yend=7.5)) +
    geom_segment(aes(x=2, y=8.5, xend=4, yend=8.5)) +
    geom_segment(aes(x=2, y=9.5, xend=4, yend=9.5)) +
    geom_segment(aes(x=2, y=10.5, xend=4, yend=10.5)) +
    geom_segment(aes(x=2, y=11.5, xend=4, yend=11.5)) +
    geom_segment(aes(x=2, y=12.5, xend=4, yend=12.5)) +
    geom_segment(aes(x=2, y=13.5, xend=4, yend=13.5)) +
    geom_segment(aes(x=2, y=14.5, xend=4, yend=14.5)) +
    geom_segment(aes(x=4, y=8, xend=6, yend=8)) +
    geom_segment(aes(x=4, y=10, xend=6, yend=10)) +
    geom_segment(aes(x=4, y=12, xend=6, yend=12)) +
    geom_segment(aes(x=4, y=14, xend=6, yend=14)) +
    geom_segment(aes(x=6, y=9, xend=8, yend=9)) +
    geom_segment(aes(x=6, y=13, xend=8, yend=13)) +
    geom_segment(aes(x=8, y=11, xend=10, yend=11)) +
    geom_segment(aes(x=2, y=9, xend=2, yend=10)) +
    geom_segment(aes(x=2, y=13, xend=2, yend=14)) +
    geom_segment(aes(x=4, y=7.5, xend=4, yend=8.5)) +
    geom_segment(aes(x=4, y=9.5, xend=4, yend=10.5)) +
    geom_segment(aes(x=4, y=11.5, xend=4, yend=12.5)) +
    geom_segment(aes(x=4, y=13.5, xend=4, yend=14.5)) +
    geom_segment(aes(x=6, y=8, xend=6, yend=10)) +
    geom_segment(aes(x=6, y=12, xend=6, yend=14)) +
    geom_segment(aes(x=8, y=9, xend=8, yend=13)) +
    
    geom_segment(aes(x=10, y=3.5, xend=10, yend=11)) +
    geom_segment(aes(x=7, y=7, xend=10, yend=7)) +
    # # right side of the bracket
    # geom_segment(aes(x=20, y=13, xend=18, yend=13)) +
    # geom_segment(aes(x=20, y=11, xend=18, yend=11)) +
    # geom_segment(aes(x=20, y=3, xend=18, yend=3)) +
    # geom_segment(aes(x=20, y=5, xend=18, yend=5)) +
    # geom_segment(aes(x=18, y=0, xend=16, yend=0)) +
    # geom_segment(aes(x=18, y=2, xend=16, yend=2)) +
    # geom_segment(aes(x=18, y=4, xend=16, yend=4)) +
    # geom_segment(aes(x=18, y=6, xend=16, yend=6)) +
    # geom_segment(aes(x=18, y=8, xend=16, yend=8)) +
    # geom_segment(aes(x=18, y=10, xend=16, yend=10)) +
    # geom_segment(aes(x=18, y=12, xend=16, yend=12)) +
    # geom_segment(aes(x=18, y=14, xend=16, yend=14)) +
    # geom_segment(aes(x=16, y=1, xend=14, yend=1)) +
    # geom_segment(aes(x=16, y=5, xend=14, yend=5)) +
    # geom_segment(aes(x=16, y=9, xend=14, yend=9)) +
    # geom_segment(aes(x=16, y=13, xend=14, yend=13)) +
    # geom_segment(aes(x=14, y=3, xend=12, yend=3)) +
    # geom_segment(aes(x=14, y=11, xend=12, yend=11)) +
    # geom_segment(aes(x=12, y=7, xend=10, yend=7)) +
    # geom_segment(aes(x=18, y=11, xend=18, yend=13)) +
    # geom_segment(aes(x=18, y=3, xend=18, yend=5)) +
    # geom_segment(aes(x=16, y=0, xend=16, yend=2)) +
    # geom_segment(aes(x=16, y=4, xend=16, yend=6)) +
    # geom_segment(aes(x=16, y=8, xend=16, yend=10)) +
    # geom_segment(aes(x=16, y=12, xend=16, yend=14)) +
    # geom_segment(aes(x=14, y=1, xend=14, yend=5)) +
    # geom_segment(aes(x=14, y=9, xend=14, yend=13)) +
    # geom_segment(aes(x=12, y=3, xend=12, yend=11)) +
    # geom_segment(aes(x=8, y=13, xend=12, yend=13)) +
    annotate('text',label = paste0(plot_names_df$team_name[plot_names_df$round == 0 & plot_names_df$bracket_id == 16],': ',m_0.3_pcts[1]), x=1, y=6.75, size=5) + 
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 0 & plot_names_df$bracket_id == 17],': ',m_0.3_pcts[2]), x=1, y=5.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 0 & plot_names_df$bracket_id == 15],': ',m_0.2_pcts[1]), x=1, y=14.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 0 & plot_names_df$bracket_id == 18],': ',m_0.2_pcts[2]), x=1, y=13.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 0 & plot_names_df$bracket_id == 14],': ',m_0.1_pcts[1]), x=1, y=10.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 0 & plot_names_df$bracket_id == 19],': ',m_0.1_pcts[2]), x=1, y=9.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 1],': ',m_1.1_pcts[1]), x=3, y=7.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 16],': ',m_1.1_pcts[2]), x=3, y=6.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 8],': ',m_1.8_pcts[1]), x=3, y=5.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 9],': ',m_1.8_pcts[2]), x=3, y=4.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 4],': ',m_1.4_pcts[1]), x=3, y=3.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 13],': ',m_1.4_pcts[2]), x=3, y=2.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 5],': ',m_1.5_pcts[1]), x=3, y=1.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 12],': ',m_1.5_pcts[2]), x=3, y=0.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 2],': ',m_1.2_pcts[1]), x=3, y=14.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 15],': ',m_1.2_pcts[2]), x=3, y=13.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 7],': ',m_1.7_pcts[1]), x=3, y=12.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 10],': ',m_1.7_pcts[2]), x=3, y=11.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 3],': ',m_1.3_pcts[1]), x=3, y=10.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 14],': ',m_1.3_pcts[2]), x=3, y=9.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 6],': ',m_1.6_pcts[1]), x=3, y=8.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 1 & plot_names_df$bracket_id == 11],': ',m_1.6_pcts[2]), x=3, y=7.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 1],': ',m_2.1_pcts[1]), x=5, y=6.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 8],': ',m_2.1_pcts[2]), x=5, y=4.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 4],': ',m_2.4_pcts[1]), x=5, y=2.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 5],': ',m_2.4_pcts[2]), x=5, y=0.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 2],': ',m_2.2_pcts[1]), x=5, y=14.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 7],': ',m_2.2_pcts[2]), x=5, y=12.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 3],': ',m_2.3_pcts[1]), x=5, y=10.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 2 & plot_names_df$bracket_id == 6],': ',m_2.3_pcts[2]), x=5, y=8.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 3 & plot_names_df$bracket_id == 1],': ',m_3.1_pcts[1]), x=7, y=5.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 3 & plot_names_df$bracket_id == 4],': ',m_3.1_pcts[2]), x=7, y=1.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 3 & plot_names_df$bracket_id == 2],': ',m_3.2_pcts[1]), x=7, y=13.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 3 & plot_names_df$bracket_id == 3],': ',m_3.2_pcts[2]), x=7, y=9.25, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 4 & plot_names_df$bracket_id == 1],': ',m_4.1_pcts[1]), x=9, y=3.75, size=5) +
    annotate('text', label = paste0(plot_names_df$team_name[plot_names_df$round == 4 & plot_names_df$bracket_id == 2],': ',m_4.1_pcts[1]), x=9, y=11.25, size=5) +
    annotate('text', label=plot_names_df$team_name[plot_names_df$round == 5], x=8.5, y=7.5, size=4) +
    annotate('text', label='Champion', x=8.5, y=6.5, size=4) +
    # labels for each match
    annotate('text', label='0-3', x=1.8, y=6, size=5) +
    annotate('text', label='0-2', x=1.8, y=13.5, size=5) +
    annotate('text', label='0-1', x=1.8, y=8.5, size=5) +
    annotate('text', label='1-1', x=3.8, y=6.5, size=5) +
    annotate('text', label='1-8', x=3.8, y=4.5, size=5) +
    annotate('text', label='1-4', x=3.8, y=2.5, size=5) +
    annotate('text', label='1-5', x=3.8, y=0.5, size=5) +
    annotate('text', label='1-2', x=3.8, y=14, size=5) +
    annotate('text', label='1-7', x=3.8, y=12, size=5) +
    annotate('text', label='1-3', x=3.8, y=10, size=5) +
    annotate('text', label='1-6', x=3.8, y=8, size=5) +
    annotate('text', label='2-1', x=5.8, y=5.5, size=5) +
    annotate('text', label='2-4', x=5.8, y=1.5, size=5) +
    annotate('text', label='2-2', x=5.8, y=13, size=5) +
    annotate('text', label='2-3', x=5.8, y=9, size=5) +
    annotate('text', label='3-1', x=7.8, y=3.5, size=5) +
    annotate('text', label='3-2', x=7.8, y=11, size=5) +
    annotate('text', label='4-1', x=10.2, y=7, size=5) +
    theme(panel.background = element_blank(),
          panel.grid = element_blank(),
          axis.ticks = element_blank(),
          axis.text = element_blank(),
          axis.title = element_blank())
}

plot_outcomes <- function(sim_results, team_number){
  ggplot(subset(sim_results, team == team_number), aes(x=result, y=sum_probs)) + 
    geom_bar(stat='identity', fill = 'darkslateblue', color='black') +
    scale_y_continuous(expand = c(0,0), limits=c(0,1), breaks=c(0, 0.25, 0.5, 0.75, 1), labels=c("0%", "25%", "50%", "75%", "100%")) +
    theme(panel.background = element_rect(fill = 'white', color='black'),
          panel.grid = element_blank(),
          axis.text.x = element_text(size=12, face='bold', color = 'black', vjust = 0.5, angle=315),
          plot.title = element_text(hjust = 0.5),
          axis.title.y = element_text(size=14)) +
    labs(x="", y = 'Probability of reaching round', title = paste('Probability that', unique(sim_results$Team[sim_results$team == team_number]), 'reaches:'))
}

team_score <- function(summ_df, team_number){
  # get team score using a normally distributed random number generator
  team_subset <- summ_df %>% filter(team_no == team_number)
  sum(apply(team_subset, 1, get_score))
}

get_score <- function(x){
  # random number generator using normal distribution and calculated mean and
  # sd from earlier
  rnorm(1, mean=as.numeric(x[3]), sd=as.numeric(x[4]))
}

get_winner <- function(summ_df, team_1, team_2){
  # take two team numbers, simulate performance, and spit out outcome
  score_1 = team_score(summ_df, team_1)
  score_2 = team_score(summ_df, team_2)
  if (score_1 > score_2){
    return(team_1)
  }else{
    return(team_2)
  }
}

get_team_number <- function(team_means, team_name){
  # takes team name and returns team number. for updating plot_names_df and reactive_plot_names team number columns.
  return(team_means$team_no[team_means$Team == team_name])
}

get_pcts <- function(matchup_results, plot_names_df, match_no){
  # gets percent chance of winning for teams based on who their opponents are.
  team_nos <- plot_names_df$team_no[plot_names_df$match == match_no]
  if (any(is.na(team_nos))){
    return(c(' ',' '))
  }else{
    p_win_1 = matchup_results[team_nos[1], team_nos[2]]
    p_win_2 = matchup_results[team_nos[2], team_nos[1]]
    return(c(percent(p_win_1), percent(p_win_2)))
  }
}