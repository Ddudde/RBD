
CREATE TABLE ���������
(
	���_����������       INTEGER AUTO_INCREMENT,
	��������             INTEGER NULL,
	������������         INTEGER NULL,
	��������             INTEGER NULL,
	ID                   INTEGER NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE ���������
ADD PRIMARY KEY (���_����������);



CREATE TABLE �����_��_������
(
	���_������           INTEGER AUTO_INCREMENT,
	�������              TEXT NULL,
	���                  TEXT NULL,
	��������             TEXT NULL,
	����_��������        DATE NULL,
	��������             TEXT NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE �����_��_������
ADD PRIMARY KEY (���_������);



CREATE TABLE �����_������������
(
	���_������������     INTEGER NOT NULL,
	���_������           INTEGER NULL,
	��������_�����       TEXT NULL
);



ALTER TABLE �����_������������
ADD PRIMARY KEY (���_������������);



CREATE TABLE �������������
(
	���_������������     INTEGER NOT NULL,
	����_�����������     DATE NULL,
	��������_�����       TEXT NULL
);



ALTER TABLE �������������
ADD PRIMARY KEY (���_������������);



CREATE TABLE ������������
(
	���_������������     INTEGER NOT NULL,
	����_�����������     DATE NULL,
	��������_�����       TEXT NULL
);



ALTER TABLE ������������
ADD PRIMARY KEY (���_������������);



CREATE TABLE �����
(
	���_������           INTEGER AUTO_INCREMENT,
	����_������          DATE NULL,
	���_����������       INTEGER NULL,
	���_�����            INTEGER NULL,
	ID                   INTEGER NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE �����
ADD PRIMARY KEY (���_������);



CREATE TABLE ����������_�����
(
	�������_�_��������   TEXT NULL,
	����_��������        DATE NULL,
	�����������_����_�������� DATE NULL,
	���_������������     INTEGER NULL,
	���_�����            INTEGER NOT NULL
);



ALTER TABLE ����������_�����
ADD PRIMARY KEY (���_�����);



CREATE TABLE �����
(
	���_�����            INTEGER AUTO_INCREMENT,
	��������             TEXT NULL,
	������������         TEXT NULL,
	���_�������          INTEGER NULL,
	���_��������         INTEGER NULL,
	�������������        INTEGER NULL,
	�����                INTEGER NULL,
	���_������           INTEGER NULL,
	ID                   INTEGER NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE �����
ADD PRIMARY KEY (���_�����);



CREATE TABLE ����������_������
(
	���_��������         INTEGER AUTO_INCREMENT,
	�������              TEXT NULL,
	���                  TEXT NULL,
	��������             TEXT NULL,
	�����                INTEGER NULL,
	�����                INTEGER NULL,
	����_��������        DATE NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE ����������_������
ADD PRIMARY KEY (���_��������);



CREATE TABLE ������������
(
	���_������������     INTEGER AUTO_INCREMENT,
	���_��������         INTEGER NOT NULL,
	���_������������     TEXT NULL,
	������               TEXT NULL,
	�������              TEXT NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE ������������
ADD PRIMARY KEY (���_������������);



CREATE TABLE ��������
(
	���_��������         INTEGER AUTO_INCREMENT,
	��������             TEXT NULL,
	����������           TEXT NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE ��������
ADD PRIMARY KEY (���_��������);



CREATE TABLE ��������
(
	���_������������     INTEGER NOT NULL,
	����_�����������     DATE NULL
);



ALTER TABLE ��������
ADD PRIMARY KEY (���_������������);



ALTER TABLE ���������
ADD FOREIGN KEY R_18 (��������) REFERENCES �������� (���_������������);



ALTER TABLE ���������
ADD FOREIGN KEY R_34 (������������) REFERENCES ������������ (���_������������);



ALTER TABLE �����_������������
ADD FOREIGN KEY (���_������������) REFERENCES ������������(���_������������)
		ON DELETE CASCADE;



ALTER TABLE �����_������������
ADD FOREIGN KEY R_44 (���_������) REFERENCES �����_��_������ (���_������);



ALTER TABLE �������������
ADD FOREIGN KEY (���_������������) REFERENCES ������������(���_������������)
		ON DELETE CASCADE;



ALTER TABLE ������������
ADD FOREIGN KEY (���_������������) REFERENCES ������������(���_������������)
		ON DELETE CASCADE;



ALTER TABLE �����
ADD FOREIGN KEY R_47 (���_����������) REFERENCES ��������� (���_����������);



ALTER TABLE �����
ADD FOREIGN KEY R_53 (���_�����) REFERENCES ����������_����� (���_�����);



ALTER TABLE ����������_�����
ADD FOREIGN KEY R_32 (���_������������) REFERENCES ������������ (���_������������);



ALTER TABLE ����������_�����
ADD FOREIGN KEY R_54 (���_�����) REFERENCES ����� (���_�����);



ALTER TABLE �����
ADD FOREIGN KEY R_17 (���_��������) REFERENCES �������� (���_��������);



ALTER TABLE �����
ADD FOREIGN KEY R_19 (�����) REFERENCES �����_������������ (���_������������);



ALTER TABLE �����
ADD FOREIGN KEY R_30 (�������������) REFERENCES ������������� (���_������������);



ALTER TABLE �����
ADD FOREIGN KEY R_46 (���_������) REFERENCES �����_��_������ (���_������);



ALTER TABLE ������������
ADD FOREIGN KEY R_22 (���_��������) REFERENCES ����������_������ (���_��������);



ALTER TABLE ��������
ADD FOREIGN KEY (���_������������) REFERENCES ������������(���_������������)
		ON DELETE CASCADE;


