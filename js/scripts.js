document.addEventListener('DOMContentLoaded', () => {
    const sections = {
        home: document.getElementById('home'),
        destinations: document.getElementById('destinations'),
        excursions: document.getElementById('excursions'),
        upcomingHoliday: document.getElementById('upcoming-holiday'),
        profile: document.getElementById('profile'),
        packingList: document.getElementById('packing-list')
    };

    function showSection(section) {
        for (let key in sections) {
            if (sections[key]) {
                sections[key].classList.add('hidden');
            }
        }
        if (sections[section]) {
            sections[section].classList.remove('hidden');
        } else {
            console.error(`Section "${section}" not found`);
        }
    }

    window.showSection = showSection;

    function showExcursions() {
        const details = document.getElementById('details');
        details.innerHTML = '<p>Excursions content goes here...</p>';
    }

    function showPackingList() {
        const details = document.getElementById('details');
        details.innerHTML = '<p>Packing List content goes here...</p>';
    }

    function showAttendees() {
        const details = document.getElementById('details');
        details.innerHTML = '<p>Attendees content goes here...</p>';
    }

    window.showExcursions = showExcursions;
    window.showPackingList = showPackingList;
    window.showAttendees = showAttendees;

    // Simulate fetching upcoming holiday details
    const destination = 'Paris';
    const date = '2024-06-15 to 2024-06-25';

    document.getElementById('destination').textContent = destination;
    document.getElementById('date').textContent = date;

        const excursionsList = document.getElementById('excursions-list');
    
        function fetchExcursions() {
            fetch('http://localhost:5000/api/excursions')
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        console.error(data.error);
                    } else {
                        displayExcursions(data);
                    }
                })
                .catch(error => console.error('Error fetching excursions:', error));
        }
    
        function displayExcursions(excursions) {
            excursionsList.innerHTML = ''; // Clear existing content
            excursions.forEach(excursion => {
                const excursionItem = document.createElement('div');
                excursionItem.classList.add('excursion-item');
                excursionItem.innerHTML = `
                    <h3>${excursion.Type}</h3>
                    <p>Category: ${excursion.ExcursionCategory}</p>
                `;
                excursionsList.appendChild(excursionItem);
            });
        }
    
        fetchExcursions();
    });


