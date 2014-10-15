class PagesController <ApplicationController

  def index
    @tolkien = Quote.new
    @tolkien.text = "Not all those who wander are lost."
    @tolkien.person = "- J.R.R. Tolkien"

    @wilde = Quote.new
    @wilde.text = "Be yourself, everyone else is already taken."
    @wilde.person = "- Oscar Wilde"

    @twain = Quote.new
    @twain.text = "Whenever you find yourself on the side of the majority, it is time to pause and reflect."
    @twain.person = "- Mark Twain"
  end

  def faq
    @what_is = Faq.new
    @what_is.question = "What is gCamp?"
    @what_is.answer = "gCamp is an awesome tool that is going to change your life. gCamp is you one stop shop to organize all your tasks and documents.  You'll also be able to track comments that you and others make. gCamp may eventually replace all need for paper and pens in the entire world. Well, maybe no, but it's going to be pretty cool."

    @join = Faq.new
    @join.question = "How do I join gCamp?"
    @join.answer = "Right now, gCamp is still in production, so there is not a sign up page open to the public yet! Your best option is to become super best friends with a gCamp developer. They can be found hanging around gSchool during the day and hitting the hottest clubs at night."

    @finished = Faq.new
    @finished.question = "When will gCamp be finished?"
    @finished.answer = "gCamp is a work in progress.  That being said, it should be fully functional by December 2014.  Functional, but our developers are going to continue to improve the site for the foreseeable future.  Check in daily for new features and awesome functionallity.  It's going to blow your mind.  Organization is only (well, will only) be a click away. Amazing!"
  end

end
