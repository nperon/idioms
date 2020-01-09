<?php require APPROOT . '/views/inc/header.php'; ?>
    <?php flash('post_message'); ?>
    <div class="row mb-3">
        <div class="col-md-6">
            <h1>Idioms</h1>
        </div>
        <div class="col-md-6">
            <a href="<?php echo URLROOT; ?>/idioms/add" class="btn btn-primary pull-right">
                <i class="fa fa-pencil"></i> Add Idiom
            </a>
        </div>
    </div>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <?php foreach($data['usedLetters'] as $letter) : ?>
            <li class="nav-item">
                <a 
                    class="nav-link<?php if($letter->letterId == array_values($data['letters'])[0]->id):echo(' active'); ?><?php endif ?>" 
                    id="<?php echo $letter->code ?>-tab" 
                    data-toggle="tab" 
                    href="#<?php echo $letter->code ?>" 
                    role="tab" 
                    aria-controls="<?php echo $letter->code ?>" 
                    aria-selected="<?php if($letter->id == array_values($data['letters'])[0]->id):echo('true'); ?><?php else: echo('false'); ?><?php endif ?>"
                ><?php echo $letter->letterName ?></a>
            </li>
        <?php endforeach; ?>
    </ul>

    <div class="tab-content container bg-light" id="myTabContent">
        <?php foreach($data['letters'] as $letter) : ?>
            <div 
                class="tab-pane fade<?php if($letter->id == array_values($data['letters'])[0]->id):echo(' show active'); ?><?php endif ?>" 
                id="<?php echo $letter->code ?>" 
                role="tabpanel" 
                aria-labelledby="<?php echo $letter->code ?>-tab"
            >
                <ul>
                    <?php foreach($data['idioms'] as $idiom) : ?>
                        <?php if( $idiom->idiomLetterCode == $letter->code ): ?>
                            <li><strong><?php echo $idiom->content ?></a></strong></li>
                        <?php endif ?>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endforeach; ?>
    </div>

<?php require APPROOT . '/views/inc/footer.php'; ?>
