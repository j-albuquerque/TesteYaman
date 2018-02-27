Dado("que eu acesse {string}") do |url|
  visit url
end

Quando("pesquisar o produto {string}") do |produto|
  fill_in(:name => 'as_word', with: produto).native.send_keys(:enter)
end

Entao("devem ser exibidos pelo menos {int} resultados") do |int|
  prod = find('ol', :id => 'searchResults').text()
  puts prod

end

Quando("navegar até a segunda página de produtos") do
  page.execute_script "window.scrollBy(0,12000)"
  find('li', :class => 'pagination__page', :text => '2').click

end

Entao("devo tirar um screeshot do penultimo item da página") do
  page.execute_script "window.scrollBy(0,12000)"
  page.save_screenshot('teste.png')
  sleep 5
end