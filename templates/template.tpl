<style>

.main {
  background-color: coral;
  padding: 50px;
  display: flex;
}
.aside{
  background-color: blue;
  width: 300px;
  height: 400px;
  font-size: 32px;
  color: white;
}
.content {
  background-color: #35fc03;
  width: 400px;
  height: 600px;
}

</style>



<main class="main">
  <aside class="aside">
    SAIDE BAR
  </aside>
  <div class="content">
    <?php echo $content;?>
  </div>
</main>