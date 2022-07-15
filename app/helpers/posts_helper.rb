# frozen_string_literal: true

module PostsHelper
  def climb_type(string)
    case string
    when 'trad'
      'Trad'
    when 'sport'
      'Sport'
    when 'bouldering'
      'Bouldering'
    when 'multipitches'
      'Multi Pitches'
    else
      'Any'
    end
  end

  def climb_class(string)
    classes = %w[p-1 rounded border text-white]
    case string
    when 'trad'
      classes << 'bg-red-400'
    when 'sport'
      classes << 'bg-blue-400'
    when 'bouldering'
      classes << 'bg-green-400'
    when 'multipitches'
      classes << 'bg-yellow-400'
    when nil
      classes << 'bg-gray-400'
    end
  end
end
