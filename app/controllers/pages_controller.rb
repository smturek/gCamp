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

end
