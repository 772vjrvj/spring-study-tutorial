 -- �ε��� �����
 -- �Խ������� �����
 -- �۹�ȣ �˻��� ���� �Ѵ�. -PK�̹Ƿ� �̹� ���÷����� ����� �� �ֹǷ� ������ ����.
 CREATE INDEX idx_board_no
 ON board(no);
 -- ���� �˻�
 CREATE INDEX idx_board_title
 ON board(title);
 -- �ۼ��� �˻�
 CREATE INDEX idx_board_writer
 ON board(writer);
 -- ����, �ۼ��� ���ÿ� �˻�
 CREATE INDEX idx_board_title_writer
 ON board(title, writer);
 -- ** �˻��� �����ϴ� ���̺��� ��� �˻��� �����ϴ� �÷��� �ӵ� ����� ���� �ε����� �����.
 