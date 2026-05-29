# Deployment Guide

## Quick Start - Local Testing

```bash
# Activate virtual environment
.\env\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt

# Run Flask app
python app.py
```

Visit: http://127.0.0.1:5000

---

## Deployment Options

### Option 1: Render.com (Recommended - Free Tier Available)

**Setup:**
1. Go to [Render.com](https://render.com)
2. Sign up with GitHub
3. Create new **Web Service**
4. Select this GitHub repository
5. Fill in the service details:
   - **Name:** elite-eats
   - **Runtime:** Python 3.11
   - **Build command:** `pip install -r requirements.txt`
   - **Start command:** `gunicorn app:app`
6. Add environment variables:
   - `PYTHON_VERSION`: 3.11.9
   - `SECRET_KEY`: Auto-generated
7. Deploy

The `render.yaml` file is already configured for automatic deployment.

---

### Option 2: Heroku (Paid - Coming Soon)

**Setup:**
1. Install Heroku CLI
2. Login: `heroku login`
3. Create app: `heroku create your-app-name`
4. Deploy: `git push heroku main`

The `Procfile` is already configured.

---

### Option 3: Railway.app (Free Tier)

**Setup:**
1. Go to [Railway.app](https://railway.app)
2. Sign up with GitHub
3. Create new project from GitHub
4. Select this repository
5. Add `requirements.txt` as dependency
6. Deploy automatically on push

---

### Option 4: Replit

**Setup:**
1. Go to [Replit.com](https://replit.com)
2. Create new Repl from GitHub
3. Select this repository
4. Run command: `python app.py`

---

## GitHub Actions CI/CD

The `.github/workflows/deploy.yml` workflow:
- Runs on every push to `main` branch
- Verifies Python syntax
- Tests dependencies
- Prepares for deployment

**View workflow status:**
1. Go to GitHub repository
2. Click **Actions** tab
3. See deployment status

---

## Environment Variables

Create a `.env` file locally (see `.env.example`):

```bash
FLASK_ENV=production
SECRET_KEY=your-super-secret-key
```

**For production (Render/Heroku):**
- Set environment variables in platform dashboard
- Never commit `.env` file to git
- `.gitignore` already excludes `.env`

---

## Database Setup

On Render/production:
1. App initializes SQLite database automatically
2. First user creation endpoint: `/init-test-user`
3. Database persists in Render's disk storage

**Test user credentials:**
- Email: `test@example.com`
- Password: `password123`

---

## Monitoring & Logs

### Render.com:
- Logs visible in Render dashboard
- Real-time monitoring
- Performance metrics

### GitHub Actions:
- View workflow logs in Actions tab
- See build/deployment errors

---

## Troubleshooting

**Port Already in Use:**
```bash
# Change port in app.py or use:
PORT=8000 python app.py
```

**Module Not Found:**
```bash
pip install -r requirements.txt
```

**Database Errors:**
```bash
# Reset database
rm instance/app.db
python app.py  # Recreates database
```

**Static Files Not Loading:**
- Ensure `templates/` and `static/` are in git
- Check file permissions

---

## Performance Optimization

- Use `gunicorn` with workers: `gunicorn -w 4 app:app`
- Enable caching headers in production
- Use CDN for static assets
- Monitor database performance

---

## Security Checklist

- [ ] Change `SECRET_KEY` in production
- [ ] Set `FLASK_ENV=production`
- [ ] Use HTTPS (automatic on Render)
- [ ] Enable CORS if needed
- [ ] Validate user input
- [ ] Keep dependencies updated

---

## Support

For issues:
1. Check GitHub Issues
2. Review error logs
3. Test locally first
4. Update all dependencies

