#!/bin/bash

echo "${YELLOW}Adding media library folder...${TXTRESET}"
mkdir -p "${PROJECT_PATH}/media"
echo "" > "${PROJECT_PATH}/media/index.php"
chmod 777 "${PROJECT_PATH}/media"

echo "${YELLOW}Generating default README.md...${TXTRESET}"
cat <<EOF > "${PROJECTS_HOME}/${PROJECT_NAME}/README.md"
# ${PROJECT_NAME}

This project is maintained by Phạm Lê Ngọc Sơn using the AIHub Template.

## Installation

In project root:

\`\`\`
composer install
nvm install
nvm use
npm install
\`\`\`

In theme directory:

\`\`\`
npm install
\`\`\`

Start development from project root:

\`\`\`
gulp
\`\`\`
EOF
