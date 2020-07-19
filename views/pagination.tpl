<div class="Pagination">
% if current_page != 0:
  % if current_page - 1 == 0:
    <a class="Pagination-arrow" href="/{{board_name}}/"><<</a>
  % else:
    <a class="Pagination-arrow" href="/{{board_name}}/{{current_page - 1}}"><<</a>
  % end
% end
<a class="Pagination-number" href="/{{board_name}}/">0</a>
<%
number = 1
for i in range(per_page, thread_count, per_page):
%>
<a class="Pagination-number" href="/{{board_name}}/{{number}}">{{number}}</a>
<%
number += 1
end
%>
% if number -1 != current_page:
<a class="Pagination-arrow" href="/{{board_name}}/{{current_page + 1}}">>></a>
% end
<a class="Pagination-number Catalog" href="/{{board_name}}/catalog">Catalog</a>
</div>
