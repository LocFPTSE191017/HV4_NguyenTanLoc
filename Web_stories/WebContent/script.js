const storyListElement = document.getElementById('stories');
const storyTextElement = document.getElementById('storyText');
const messageElement = document.getElementById('message');

function setMessage(text, isError = false) {
    messageElement.textContent = text;
    messageElement.classList.toggle('error', isError);
    messageElement.classList.toggle('success', !isError);
}

function loadStoryList() {
    fetch('story')
        .then((response) => response.json())
        .then((data) => {
            storyListElement.innerHTML = '';
            data.forEach((story) => {
                const item = document.createElement('li');
                item.innerHTML = `<strong>${story.title}</strong>`;
                item.addEventListener('click', () => loadStory(story.id));
                storyListElement.appendChild(item);
            });
        })
        .catch(() => {
            setMessage('Không thể tải danh sách truyện. Vui lòng thử lại sau.', true);
        });
}

function loadStory(storyId) {
    fetch(`story?id=${encodeURIComponent(storyId)}`)
        .then((response) => {
            if (!response.ok) {
                if (response.status === 403) {
                    throw new Error('Bạn phải đăng nhập để xem nội dung truyện.');
                }
                throw new Error('Lỗi khi tải truyện.');
            }
            return response.json();
        })
        .then((data) => {
            setMessage('');
            storyTextElement.textContent = data.content;
        })
        .catch((error) => {
            storyTextElement.textContent = '';
            setMessage(error.message, true);
        });
}

window.addEventListener('DOMContentLoaded', () => {
    const params = new URLSearchParams(window.location.search);
    if (params.get('message')) {
        setMessage(params.get('message'), false);
    } else if (params.get('error')) {
        setMessage(params.get('error'), true);
    }
    loadStoryList();
});
