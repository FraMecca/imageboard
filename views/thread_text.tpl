% import re
% from json import loads
% def make_refs(word):
  % if word[:2] == ">>":
    % ref = word[2:]
    % if ref.rstrip().isdigit():
      % ref = int(ref)
    % else:
      >>{{ref}}
      % return
    % end
    % if ref > board.last_id:
      >>{{ref}}
      % return
    % end
    % thread_ref = board.get_thread(ref)
    % if thread_ref == 1:
    	>>{{ref}}
      % return
    % end
    % if thread_ref.is_reply:
      % main_thread = board.get_thread(thread_ref.replyrefnum)
      <a class="reference" href="/{{board_name}}/thread/{{thread_ref.replyrefnum}}#{{ref}}">{{word}}
      % if main_thread.author == thread_ref.author:
      (OP)
      % end
      % if thread_ref.author == current_user.user and main_thread.author != current_user.user:
      (YOU)
      % end
      </a>
    % else:
      <a class="reference" href="/{{board_name}}/thread/{{ref}}">{{word}}
      % if ref == thread.replyrefnum:
       (OP)
      % elif thread_ref.author == current_user.user:
       (YOU)
      % end
      </a>
    % end
  % else:
    {{word}}
  % end
% end
% def print_line(line):
  % for word in line.split(" "):
    % make_refs(word)
  % end
% end
% content = thread.content if is_detail else thread.short_content
% for line in content.split('\n'):
  % if line.startswith(">") and line[1] != ">":
    <span class="green-text">{{line}}</span><br>
  % elif line.startswith("<"): 
    <span class="pink-text">{{line}}</span><br>
  % elif re.search(r'(https?://)(www.)?youtu(be.com|.be)/(watch\?v=)?[A-Za-z0-9-_]{11}\s?$', line):
    <div class="yt-container">
      <span class="yt-url"> {{line}}</span> <span class="btn play">Play</span><br>
    </div>
  % else:
    % print_line(line)
    % if line != content.split('\n')[-1]:
      <br>
    % end
  % end
% end
% if (len(thread.content.split(' ')) > 200 or len(thread.content.split('\n')) > 10) and not is_detail:
  <span class="btn full-thread">Load full thread</span>
% end
