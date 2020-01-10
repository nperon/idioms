<?php require APPROOT . '/views/inc/header.php'; ?>
    <a href="<?php echo URLROOT; ?>/idioms" class="btn btn-light"><i class="fa fa-backward"></i> Back</a>
    <div class="card card-body bg-light mt-5">
        <h2>Add Idiom</h2>
        <p>Add a new idiom together with a sorting letter with this form</p>
        <form action="<?php echo URLROOT; ?>/idioms/add" method="post">
            <div class="form-group">
                <label for="content">Idiom: <sup>*</sup></label>
                <input 
                    type="text"
                    name="content"
                    class="form-control form-control-lg <?php echo (!empty($data['content_err'])) ? 'is-invalid' : ''; ?>"
                    value="<?php echo $data['content']; ?>"
                >
                <span class="invalid-feedback"><?php echo $data['content_err']; ?></span>
            </div>
            <div class="form-group">
                <label for="letterId">Sorting Letter: <sup>*</sup></label>
                <select
                    type="text"
                    name="letter_code"
                    class="form-control form-control-lg <?php echo (!empty($data['letter_err'])) ? 'is-invalid' : ''; ?>"
                    value="<?php echo $data['letter_code']; ?>"
                >
                    <?php foreach($data['letters'] as $letter) : ?>
                        <option
                            value="<?php echo $letter->code; ?>"
                            <?php if($letter->code == $data['letter_code']) :  ?>
                            <?php endif; ?>                            
                        >
                            <?php echo $letter->name; ?>
                        </option>
                    <?php endforeach; ?>
                </select>
                <span class="invalid-feedback"><?php echo $data['letter_err']; ?></span>
            </div>
            <input type="submit" class="btn btn-success" value="Submit">
        </form>
    </div>
<?php require APPROOT . '/views/inc/footer.php'; ?>