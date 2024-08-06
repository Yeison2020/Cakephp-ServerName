<h1>Posts</h1>

<?php if (isset($posts)): ?>
    <ul>
        <?php foreach ($posts as $post): ?>
            <li>
                <strong><?php echo h($post['title']); ?></strong><br>
                <?php echo h($post['body']); ?>
            </li>
        <?php endforeach; ?>
    </ul>
<?php else: ?>
    <p>Error: <?php echo h($error); ?></p>
    <p>Status Code: <?php echo h($statusCode); ?></p>
<?php endif; ?>
