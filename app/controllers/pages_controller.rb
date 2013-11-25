class PagesController < ApplicationController
  layout "landing"

  def welcome

  end

  def tours
    set_page_title "Guided Tour"
  end

  def pricing
    set_page_title "Pricing & Plans"
  end

  def explore
    set_page_title "Explore"
  end
end