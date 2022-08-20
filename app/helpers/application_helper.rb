# frozen_string_literal: true

module ApplicationHelper
  # Tailwind CSS class components
  def form_label_style
    %w[block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2]
  end

  def form_input_style
    %w[px-2 py-1 border border-blue-400 rounded-md shadow]
  end

  def form_select_box_style
    %w[block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded
       leading-tight focus:outline-none focus:bg-white focus:border-gray-500]
  end

  def primary_btn_style
    %w[bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline]
  end

  def warning_btn_style
    %w[bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline]
  end

  def danger_btn_style
    %w[bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline]
  end

  def submit_btn_style
    %w[px-20 py-2 bg-indigo-700 text-white rounded]
  end

  def link_style
    %w[underline p-2 my-4 text-blue-600]
  end

  def navbar_button_style
    %w[block px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent
       dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white
       dark-mode:text-gray-200 md:mt-0 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200
       focus:outline-none focus:shadow-outline]
  end

  def turbo_stream_flash
    turbo_stream.update 'flash', partial: 'flash'
  end
end
