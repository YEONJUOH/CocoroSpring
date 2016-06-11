<!doctype html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <title>HTML2Jade - HTML to Jade Online Realtime Converter</title>
        <meta name="description" content="HTML2jade help you convert a HTML snippet to a Jade snippet. Useful for testing out how something would look in Jade vs HTML">
        <meta property="og:title" content="HTML to Jade Converter">
        <meta property="og:site_name" content="HTML2Jade">
        <meta property="og:image" content="http://www.html2jade.org/img/logo_fb.png">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="shortcut icon" href="/favicon.ico">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="js/src-min-noconflict/ace.js"></script>
        <script src="js/jade.js"></script>
        <script src="/socket.io/socket.io.js"></script>
        <script data-main="js/main" src="js/require.js"></script>
        <script src="/libs/jquery/dist/jquery.min.js"></script>

    </head>
    <body>
      <header>
        <h1 id="logo">HTML to Jade Converter</h1>
      </header>

      <div id="container">
      <label>
        <input type="checkbox" name="bodyless" class="bodyless">Do not output enveloping html and body tags</input>

      </label>
        <div class="error hide"></div>
          <div id="tabs1-html2jade" class="tab-content blue">
            <div class="contain-editor">
                <div id="html_editor" class="editor input" ></div>
                <div id="jade_editor" class="editor output" ></div>
            </div>
          </div>
      </div>

      <article>
        <div class="information">
            <b>HTML2jade</b> help you convert a HTML snippet to a Jade snippet. Useful for testing out how something would look in Jade vs HTML
        </div>
      </article>

      <footer>
        <div class="powered_by">
            Experiment by <a href="mailto:salanyot[at]gmail.com" target="_blank" >chenka</a>
            | Powered by
            <a href="http://jade-lang.com/" target="_blank" >Jade</a>,
            <a href="https://github.com/donpark/html2jade" target="_blank" >html2jade</a>,
            <a href="http://ace.c9.io/" target="_blank" >Ace</a>
        </div>
      </footer>

      <iframe id="html2jade_iframe"></iframe>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-1567796-5', 'html2jade.org');
  ga('send', 'pageview');

</script>
</body>
</html>

