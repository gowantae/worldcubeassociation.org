class CompetitionsMailer < ApplicationMailer
  helper :markdown

  def notify_board_of_confirmed_competition(confirmer, competition)
    @competition = competition
    @confirmer = confirmer
    mail(
      to: "board@worldcubeassociation.org",
      cc: competition.delegates.pluck(:email),
      reply_to: confirmer.email,
      subject: "#{confirmer.name} just confirmed #{competition.name}",
    )
  end

  def notify_users_of_results_presence(user, competition)
    @competition = competition
    @user = user
    mail(
      to: user.email,
      subject: "The results of #{competition.name} are posted",
    )
  end

  def notify_of_delegate_report_submission(competition)
    @competition = competition
    mail(
      to: "delegates@worldcubeassociation.org",
      cc: competition.delegates.pluck(:email),
      subject: "[wca-report] [#{competition.continent.name}] #{competition.name}",
    )
  end

  def submit_results_nag(competition)
    @competition = competition
    mail(
      to: competition.delegates.pluck(:email),
      cc: "results@worldcubeassociation.org",
      reply_to: "results@worldcubeassociation.org",
      subject: "#{competition.name} Results",
    )
  end
end
