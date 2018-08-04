import Layout from '../components/MyLayout.js'
import Link from 'next/link'
import fetch from 'isomorphic-unfetch'
import '../styles/style.scss'

const Index = (props) => (
    <Layout>
        <h1>Batman TV Shows 777</h1>
        <style jsx>{`
          li {
            font-size: 14px;
          }
        `}</style>
            <style global jsx>{`
          body {
            background: white;
          }
        `}</style>
        <ul>

            {props.shows.map(({show}) => (
                <li key={show.id}>
                    <Link as={`/p/${show.id}`} href={`/post?id=${show.id}`}>
                        <a>{show.name}</a>
                    </Link>
                </li>
            ))}
        </ul>
        <button>button</button>
        <img width={ 100 } src="/static/images/img-about-shirts-01.png" alt="my image" />
    </Layout>
)

Index.getInitialProps = async function() {
    const res = await fetch('https://api.tvmaze.com/search/shows?q=batman')
    const data = await res.json()

    console.log(`Show data fetched. Count: ${data.length}`)

    return {
        shows: data
    }
}

export default Index