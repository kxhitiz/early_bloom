module PostsHelper
  def reaction_emoji(reaction_type)
    case reaction_type
    when 'helpful'
      '💡'
    when 'reassuring'
      '💚'
    when 'relatable'
      '🤝'
    when 'celebrate'
      '🎉'
    else
      '👍'
    end
  end
end
