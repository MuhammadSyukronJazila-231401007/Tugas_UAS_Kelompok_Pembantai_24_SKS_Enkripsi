program caesarCipher;

uses crt;

function  encrypt(text: string; shift: integer):string;
var i,decimal: integer;
begin
    shift := shift mod 26;
    for i := 1 to length(text) do 
    begin
        decimal := ord(text[i]);//Mengubah karakter menjadi kode ASCII
        if (decimal >= 97) and (decimal <= 122) then // ketika karakter huruf kecil
        begin
            decimal := decimal + shift; //Menggeser karakter huruf
            if decimal > 122 then decimal := decimal - 26 //jika kode ASCII decimal melebihi kode ASCII z (122)
            else if decimal < 97 then decimal := decimal + 26;//jika kode ASCII decimal kurang dari kode ASCII a (97)
        end
        else if (decimal >= 65) and (decimal <= 90) then // ketika karakter huruf kapital
        begin
            decimal := decimal + shift;
            if decimal > 90 then decimal := decimal - 26 //jika kode ASCII decimal melebihi kode ASCII Z (90)
            else if decimal < 65 then decimal := decimal + 26;//jika kode ASCII decimal kurang dari kode ASCII A (65)
        end;
        text[i] := chr(decimal); //mengubah kode ASCII menjadi karakter huruf
    end;
    encrypt := text;
end;

var 
shift: integer;
text: string;
ulang : char;
label cobaLagi;
begin
repeat
    clrscr;
    writeln('  ______  _   _   _____  _____ __     __ _____  _________');
    writeln(' |  ____|| \ | | / ____||  __ \\ \   / /|  __ \ |__   __|');
    writeln(' | |__   |  \| || |     | |__) |\ \_/ / | |__) |   | |   ');
    writeln(' |  __|  | . ` || |     |  _  /  \   /  |  ___/    | |   ');
    writeln(' | |____ | |\  || |____ | | \ \   | |   | |        | |   ');
    writeln(' |______||_| \_| \_____||_|  \_\  |_|   |_|        |_|   ');
    writeln('===========================================================');
    writeln('    105    116     103     122    131      120     124 ');
    writeln;
    writeln('---------------------------------------------------');
    writeln('| Input a message :                               |');
    writeln('| shift value     :                               |');
    writeln('|=================================================|');
    textcolor(10);writeln('| Output          :                               |');textcolor(white);
    writeln('|=================================================|');
    writeln('| Apakah Anda ingin mengulang enkripsi ? (y/n)    |');
    writeln('---------------------------------------------------');
    gotoxy(21,11);readln(text);
    gotoxy(21,12);readln(shift);
    text := encrypt(text, shift);
    textcolor(10);gotoxy(21,14);writeln(text);textcolor(white);
    cobaLagi :
    gotoxy(47,16);ulang := readkey;
    ulang := upcase(ulang);
    if (ulang <> 'Y') and (ulang <> 'N') then
    begin
      gotoxy(3,18);writeln('Anda salah menginput karakter, Silakan input karakter yang sesuai');
      goto cobaLagi;
    end; 
until ulang ='N';   
end. 