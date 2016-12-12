class TicketsMailer < ApplicationMailer

  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('mailer.buy_ticket'))
  end

    def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('mailer.delete_ticket'))
  end

end
