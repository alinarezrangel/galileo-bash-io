(function () {
function lookAhead(x, ipos, n) {
var i, c, ch, text;
text = "";
for (i = ipos; i < ipos + n; i++) {
  if (i < x.length) {
    c = x.charAt(i);
    ch = c.charCodeAt(0);  
    if (ch == 32 || ch == 10 || ch == 13 || ch == 9 ) {
      text += " ";        
    } else {
      text += c;
    }
  }
}
return text;
}
function lookWord(x, ipos) {
var i, c, ch, text;
text = "";
for (i = ipos; i < x.length; i++) {
  c = x.charAt(i);
  ch = c.charCodeAt(0);  
  if (ch == 10 || ch == 13 || ch == 9 || ch == 32 || ch == 38 || ch == 40 || ch == 41 || ch == 42 || ch == 43 ||
  ch == 44 || ch == 58 || ch == 47 || ch == 58 || ch == 59 || ch == 60 || ch == 61 || ch == 91 || ch == 93) {
    return text;        
  } else {
    text += c;
  }
}
return text;
}
var x, y, z, i, j, k, c, ch, text, status, ele, comp, pos;
jsArr = ["if", "then", "else", "elif", "fi", "case", "esac", "for", "select", "while", "until", "do", "done", "in", "function", "time", "{", "}", "!", "[[", "]]", "coproc", "pinMode.sh", "digitalRead.sh", "digitalWrite.sh", "analogRead.sh", "analogWrite.sh", "undoPinMode.sh", "utility.sh", "echo", "read", "cat", "test", "[", "]", "sleep"];
if (!document.getElementsByClassName) {return;}
y = document.getElementsByClassName("bashHigh");
for (j = 0; j < y.length; j++) {
z = y[j];
ele = "";
text = "";
status = "";
x = z.innerHTML;

for (i = 0; i < x.length; i++) {
  c = x.charAt(i);
  ch = c.charCodeAt(0);
  if (ch == 32 || ch == 10 || ch == 13 || ch == 9 ) {
    text += c;
    continue;
  }
  if (lookAhead(x, i, 1) == "#") {
    text += "<span style='color:green'>";  
    pos = x.substr(i).indexOf("<br>");
    if (pos == -1) {
      text += x.substr(i); 
      i = x.length;
    } else {
      text += x.substr(i,pos + 4);
      i += pos + 3;
    }  
    text += "</span>"
    continue;
  }
  if (c == "&") {
    pos = x.substr(i).indexOf(";");
    if (pos == -1) {
      text += x.substr(i); 
      i = x.length;
    } else {
      text += x.substr(i,pos + 1);
      i += pos;
    }  
    continue;
  }
  if (c == "'" || c == '"') {
    text += "<span style='color:mediumblue'>";  
    pos = x.substr(i+1).indexOf(c);
    if (pos == -1) {
      text += x.substr(i); 
      i = x.length;
    } else {
      text += x.substr(i, pos + 2);
      i += pos + 1;
    }  
    text += "</span>"
    continue;
  }
  if (lookAhead(x, i, 4) == "<br>") {
    i += 3;
    text += "<br>";
    continue
  }
  ele = lookWord(x, i);
  if (ele) {
    if (ele =="true" || ele == "false" || isNaN(ele) == false) {  
      text += "<span style='color:mediumblue'>" + x.substr(i,ele.length) + "</span>";
      i += ele.length - 1;
      status = "";
      continue;
    }
    for (k = 0; k < jsArr.length; k++) {
      if (ele == jsArr[k]) {
        text += "<span style='color:brown'>" + x.substr(i,ele.length) + "</span>";
        i += ele.length - 1;
        status = "SPW";
        break;
      }  
    }
    if (status == "SPW") {
      status = "";
      continue;   
    } else {
      text += x.substr(i, ele.length);
      i += ele.length - 1;
      continue;
    }
  }
  text += c;
}
z.innerHTML = text;
}})();
