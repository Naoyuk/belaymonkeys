# frozen_string_literal: true

module PostsHelper
  def climb_type(string)
    return 'Any' if string.nil?

    return 'Multi Pitches' if string == 'multipitches'

    string.capitalize
  end

  def climb_class(string)
    classes = %w[p-1 rounded border]
    bg_colors = {
      'trad' => 'bg-red-400 text-white',
      'sport' => 'bg-blue-400 text-white',
      'bouldering' => 'bg-green-400 text-white',
      'multipitches' => 'bg-yellow-400 text-white'
    }
    classes << bg_colors[string]
    classes
  end
end
