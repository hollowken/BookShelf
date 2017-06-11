class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :genres

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def genres
    @genres = [['Фантастика'], ['Фэнтези'], ['Ужасы'], ['Повесть'], ['Рассказ'], ['Боевик'], ['Бизнес'], ['Классика'],
               ['Роман'], ['Детектив'], ['Саморазвитие'], ['Профессиональная'], ['Психология'], ['Остальное']]
  end

end
